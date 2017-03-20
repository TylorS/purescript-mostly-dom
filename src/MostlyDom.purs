module MostlyDom ( patch, elementToVNode, module MostlyDom.Hyperscript ) where

import DOM.Node.Types (Element)
import MostlyDom.Hyperscript
  ( text
  , element
  , a, abbr, address, area, article, aside, audio, b, base, bdi, bdo
  , blockquote, body, br, button, canvas, caption, cite, code, col
  , colgroup, data', datalist, dd, del, details, dfn, div, dl, dt, em, embed
  , fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6
  , head, header, hr, html, i, iframe, img, input, ins, kbd, label, legend
  , li, link, main, map', mark, meta, meter, nav, noframes, noscript, object
  , ol, optgroup, option, p, param, pre, progress, q, rp, rt, rtc, ruby, s
  , samp, script, section, select, slot, small, source, span, strong
  , style, sub, summary, sup, table, tbody, td, template, textarea, tfoot, th
  , thead, time, title, tr, track, u, ul, var, video, wbr
  , VNode(..)
  , TagName(..)
  , Property(..)
  , MediaType(..)
  , LinkType(..)
  , TargetType(..)
  )

foreign import patch :: VNode -> VNode -> VNode
foreign import elementToVNode :: Element -> VNode