var MostlyDom = require('mostly-dom')
var Maybe = require('../Data.Maybe')
var H = require('../MostlyDom.Hyperscript')

var MostlyDomPatch = MostlyDom.init([])

exports.patch = patch
exports.elementToVNode = elementToVNode

function patch (formerVNode) {
  return function (vNode) {
    vNode = MostlyDomPatch(PSToJS(formerVNode), PSToJS(vNode))

    return JSToPS(vNode)
  }
}

function elementToVNode (element) {
  return JSToPS(MostlyDom.elementToVNode(element))
}

function PSToJS (vNodeWrapper) { // eslint-disable-line complexity
  var vNode = vNodeWrapper.value0

  if (vNode.value) {
    return {
      tagName: void 0,
      id: void 0,
      className: void 0,
      props: {},
      children: void 0,
      text: vNode.value,
      key: void 0,
      element: vNode.element.value0 || void 0,
      namespace: void 0,
      scope: void 0,
      parent: void 0,
    }
  }

  var tagName = vNode.tagName.constructor.name.toLowerCase()
  var attrs = {}
  var props = { attrs: attrs }
  var properties = vNode.properties
  var children = vNode.children && vNode.children.map(PSToJS) || void 0
  var key = void 0
  var element = vNode.element.value0 || void 0

  for (var i = 0; i < properties.length; ++i) {
    var property = properties[i]
    var propertyName = property.constructor.name

    // only Attr uses 2 values
    if (propertyName === 'Attr') {
      attrs[property.value0] = property.value1
    } else if (propertyName === 'Key') {
      key = property.value0
    } else {
      var value = property.value0
      propertyName = propertyName[0].toLowerCase() + propertyName.slice(1)

      if (propertyName === 'update' || propertyName === 'remove' ||
        propertyName === 'prepatch' || propertyName === 'postpatch'
      ) {
        value = uncurry2(value)
      }

      if (propertyName === 'init' || propertyName === 'create' ||
        propertyName === 'destroy' || propertyName === 'insert'
      ) {
        var f = value
        value = function (x) { f(JSToPS(x)) }
        value.f = f
      }

      props[propertyName] = value
    }
  }

  return {
    tagName: tagName,
    id: void 0,
    className: void 0,
    props: props,
    children: children,
    text: void 0,
    key: key,
    element: element,
    namespace: void 0,
    scope: void 0,
    parent: void 0,
  }
}

function uncurry2 (f) {
  function uncurried (a, b) {
    if (typeof b === 'function') {
      return f(JSToPS(a))(b)
    }

    return f(JSToPS(a))(JSToPS(b))
  }

  uncurried.f = f

  return uncurried
}

var hooks = ['init', 'create', 'update', 'remove', 'destroy', 'prepatch', 'postpatch', 'insert']

function JSToPS (vNode) { // eslint-disable-line complexity
  if (vNode.text) {
    return H.TextVNode.create({ value: vNode.text, element: Maybe.Just.create(vNode.element) })
  }

  var tagName = H[vNode.tagName.toUpperCase()].value
  var children = vNode.children.map(JSToPS)
  var element = vNode.element ? Maybe.Just.create(vNode.element) : Maybe.Nothing.value
  var properties = []

  var props = vNode.props || {}
  var attrs = props.attrs || {}

  if (vNode.className) {
    properties.push(H.ClassName.create(vNode.className))
  }

  if (vNode.id) {
    properties.push(H.Id.create(vNode.id))
  }

  Object.keys(attrs).forEach(function (attr) {
    properties.push(H.Attr.create(attr)(attrs[attr]))
  })

  var keys = Object.keys(props)

  for (var i = 0; i < keys.length; ++i) {
    var key = keys[i]

    if (key === 'attrs' || key === 'key') {
      continue
    }

    var name = key[0].toUpperCase() + key.slice(1)

    if (hooks.indexOf(key) > -1) {
      properties.push(H[name].create(props[key].f))
      continue
    }

    if (H[name]) {
      properties.push(H[name].create(props[key]))
    }
  }

  return H.ElementVNode.create({
    tagName: tagName,
    properties: properties,
    element: element,
    children: children,
    key: vNode.key ? Maybe.Just.create(vNode.key) : Maybe.Nothing.value
  })
}
