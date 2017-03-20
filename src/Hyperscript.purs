module MostlyDom.Hyperscript
  ( text, element
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
  , Property(..)
  , MediaType(..)
  , LinkType(..)
  , TargetType(..)
  , TagName(..)
  , VNode(..)
  ) where

import Control.Monad.Eff (Eff)
import Data.BooleanAlgebra ((&&))
import Data.Eq (class Eq, (==))
import Data.Maybe (Maybe(..))
import Data.Semigroup ((<>))
import Data.Show (class Show, show)
import Data.Unit (Unit)
import DOM.HTML.Types (HTMLTableCaptionElement)
import DOM.Node.Types (HTMLCollection, Element, Text)

text :: String -> VNode
text value = TextVNode { value, element: Nothing }

element :: TagName -> Array Property -> Array VNode -> VNode
element tagName properties children = ElementVNode
  { tagName
  , properties
  , children
  , element: Nothing
  , key: Nothing
  }

a :: Array Property -> Array VNode -> VNode
a = element A
abbr :: Array Property -> Array VNode -> VNode
abbr = element ABBR
address :: Array Property -> Array VNode -> VNode
address = element ADDRESS
area :: Array Property -> Array VNode -> VNode
area = element AREA
article :: Array Property -> Array VNode -> VNode
article = element ARTICLE
aside :: Array Property -> Array VNode -> VNode
aside = element ASIDE
audio :: Array Property -> Array VNode -> VNode
audio = element AUDIO
b :: Array Property -> Array VNode -> VNode
b = element B
base :: Array Property -> Array VNode -> VNode
base = element BASE
bdi :: Array Property -> Array VNode -> VNode
bdi = element BDI
bdo :: Array Property -> Array VNode -> VNode
bdo = element BDO
blockquote :: Array Property -> Array VNode -> VNode
blockquote = element BLOCKQUOTE
body :: Array Property -> Array VNode -> VNode
body = element BODY
br :: Array Property -> Array VNode -> VNode
br = element BR
button :: Array Property -> Array VNode -> VNode
button = element BUTTON
canvas :: Array Property -> Array VNode -> VNode
canvas = element CANVAS
caption :: Array Property -> Array VNode -> VNode
caption = element CAPTION
cite :: Array Property -> Array VNode -> VNode
cite = element CITE
code  :: Array Property -> Array VNode -> VNode
code = element CODE
col :: Array Property -> Array VNode -> VNode
col = element COL
colgroup :: Array Property-> Array VNode -> VNode
colgroup = element COLGROUP
data' :: Array Property -> Array VNode -> VNode
data' = element DATA
datalist :: Array Property -> Array VNode -> VNode
datalist = element DATALIST
dd :: Array Property -> Array VNode -> VNode
dd = element DD
del :: Array Property -> Array VNode -> VNode
del = element DEL
details :: Array Property -> Array VNode -> VNode
details = element DETAILS
dfn :: Array Property -> Array VNode -> VNode
dfn = element DFN
div :: Array Property -> Array VNode -> VNode
div = element DIV
dl :: Array Property -> Array VNode -> VNode
dl = element DL
dt :: Array Property -> Array VNode -> VNode
dt = element DT
em :: Array Property -> Array VNode -> VNode
em = element EM
embed :: Array Property -> Array VNode -> VNode
embed = element EMBED
fieldset :: Array Property -> Array VNode -> VNode
fieldset = element FIELDSET
figcaption :: Array Property -> Array VNode -> VNode
figcaption = element FIGCAPTION
figure :: Array Property -> Array VNode -> VNode
figure = element FIGURE
footer :: Array Property -> Array VNode -> VNode
footer = element FOOTER
form :: Array Property -> Array VNode -> VNode
form = element FORM
h1 :: Array Property -> Array VNode -> VNode
h1 = element H1
h2 :: Array Property -> Array VNode -> VNode
h2 = element H2
h3 :: Array Property -> Array VNode -> VNode
h3 = element H3
h4 :: Array Property -> Array VNode -> VNode
h4 = element H4
h5 :: Array Property -> Array VNode -> VNode
h5 = element H5
h6 :: Array Property -> Array VNode -> VNode
h6 = element H6
head :: Array Property -> Array VNode -> VNode
head = element HEAD
header :: Array Property -> Array VNode -> VNode
header = element HEADER
hr :: Array Property -> Array VNode -> VNode
hr = element HR
html :: Array Property -> Array VNode -> VNode
html = element HTML
i :: Array Property -> Array VNode -> VNode
i = element I
iframe :: Array Property -> Array VNode -> VNode
iframe = element IFRAME
img :: Array Property -> Array VNode -> VNode
img = element IMG
input  :: Array Property -> Array VNode -> VNode
input = element INPUT
ins :: Array Property -> Array VNode -> VNode
ins = element INS
kbd :: Array Property -> Array VNode -> VNode
kbd = element KBD
label :: Array Property -> Array VNode -> VNode
label = element LABEL
legend :: Array Property -> Array VNode -> VNode
legend = element LEGEND
li :: Array Property -> Array VNode -> VNode
li = element LI
link :: Array Property -> Array VNode -> VNode
link = element LINK
main :: Array Property -> Array VNode -> VNode
main = element MAIN
map' :: Array Property -> Array VNode -> VNode
map' = element MAP
mark :: Array Property -> Array VNode -> VNode
mark = element MARK
meta :: Array Property -> Array VNode -> VNode
meta = element META
meter :: Array Property -> Array VNode -> VNode
meter = element METER
nav :: Array Property -> Array VNode -> VNode
nav = element NAV
noframes :: Array Property -> Array VNode -> VNode
noframes = element NOFRAMES
noscript :: Array Property -> Array VNode -> VNode
noscript = element NOSCRIPT
object :: Array Property -> Array VNode -> VNode
object = element OBJECT
ol :: Array Property -> Array VNode -> VNode
ol = element OL
optgroup :: Array Property -> Array VNode -> VNode
optgroup = element OPTGROUP
option :: Array Property -> Array VNode -> VNode
option = element OPTION
p :: Array Property -> Array VNode -> VNode
p = element P
param :: Array Property -> Array VNode -> VNode
param = element PARAM
pre :: Array Property -> Array VNode -> VNode
pre = element PRE
progress :: Array Property -> Array VNode -> VNode
progress = element PROGRESS
q :: Array Property -> Array VNode -> VNode
q = element Q
rp :: Array Property -> Array VNode -> VNode
rp = element RP
rt :: Array Property -> Array VNode -> VNode
rt = element RT
rtc :: Array Property -> Array VNode -> VNode
rtc = element RTC
ruby :: Array Property -> Array VNode -> VNode
ruby = element RUBY
s :: Array Property -> Array VNode -> VNode
s = element S
samp :: Array Property -> Array VNode -> VNode
samp = element SAMP
script :: Array Property -> Array VNode -> VNode
script = element SCRIPT
section :: Array Property -> Array VNode -> VNode
section = element SECTION
select :: Array Property -> Array VNode -> VNode
select = element SELECT
slot :: Array Property -> Array VNode -> VNode
slot = element SLOT
small :: Array Property -> Array VNode -> VNode
small = element SMALL
source :: Array Property -> Array VNode -> VNode
source = element SOURCE
span :: Array Property -> Array VNode -> VNode
span = element SPAN
strong :: Array Property -> Array VNode -> VNode
strong = element STRONG
style :: Array Property -> Array VNode -> VNode
style = element STYLE
sub :: Array Property -> Array VNode -> VNode
sub = element SUB
summary :: Array Property -> Array VNode -> VNode
summary = element SUMMARY
sup :: Array Property -> Array VNode -> VNode
sup = element SUP
table :: Array Property -> Array VNode -> VNode
table = element TABLE
tbody :: Array Property -> Array VNode -> VNode
tbody = element TBODY
td :: Array Property -> Array VNode -> VNode
td = element TD
template :: Array Property -> Array VNode -> VNode
template = element TEMPLATE
textarea :: Array Property -> Array VNode -> VNode
textarea = element TEXTAREA
tfoot :: Array Property -> Array VNode -> VNode
tfoot = element TFOOT
th:: Array Property -> Array VNode -> VNode
th = element TH
thead :: Array Property -> Array VNode -> VNode
thead = element THEAD
time :: Array Property -> Array VNode -> VNode
time = element TIME
title :: Array Property -> Array VNode -> VNode
title = element TITLE
tr :: Array Property -> Array VNode -> VNode
tr = element TR
track :: Array Property -> Array VNode -> VNode
track = element TRACK
u :: Array Property -> Array VNode -> VNode
u = element U
ul :: Array Property -> Array VNode -> VNode
ul = element UL
var :: Array Property -> Array VNode -> VNode
var = element VAR
video :: Array Property -> Array VNode -> VNode
video = element VIDEO
wbr :: Array Property -> Array VNode -> VNode
wbr = element WBR

data Property
  -- VNode Specific
  = Attr String String -- for creating attributes
  | Key String -- for ordering children
  | Init (VNode -> Unit)
  | Create (VNode -> Unit)
  | Update (VNode -> VNode -> Unit)
  | Remove (VNode -> Eff () Unit -> Unit)
  | Destroy (VNode -> Unit)
  | Prepatch (VNode -> VNode -> Unit)
  | Postpatch (VNode -> VNode -> Unit)
  | Insert (VNode -> Unit)
  -- Properties inherited by all HTMLElements
  | AccessKey String | ClassName String | ContentEditable Boolean
  | ContextMenu String | Data String | Dir String | Draggable Boolean
  | Dropzone String | Hidden Boolean | Id String | InnerHTML String
  | Lang String | Style String | TabIndex Boolean | Title String
  -- Properties for various other elements
  | Abbr String | Axis String | Accept String
  | AcceptCharset String | Action String | Align String
  | AllowFullscreen Boolean | Alt String | AltHtml String | Archive String
  | Async Boolean | Autocomplete String | Autofocus Boolean | Autoplay Boolean
  | Background String | Behavior String | BgColor String | BgProperties String
  | Border String | BorderColor String | Caption HTMLTableCaptionElement
  | CellPadding String | Cells HTMLCollection | CellSpacing String
  | Charset String | Checked Boolean | Cite String | Clear String  | Code String
  | CodeBase String | CodeType String | Cols String | ColSpan String
  | Compact Boolean | Content String | Coords String | Controls Boolean
  | CrossOrigin String | CurrentTime String | Declare Boolean | Default Boolean
  | DefaultChecked Boolean | DefaultMuted Boolean | DefaultPlaybackRate Number
  | DefaultSelected Boolean | DefaultValue String | Defer Boolean
  | Direction String | Disabled Boolean | Download String | Encoding String
  | Enctype String | Event String | Face String | FormAction String
  | FormEnctype String | FormMethod String | FormNoValidate String
  | FormTarget String | Frame String | FrameBorder String | Hash String
  | Headers String | HideFocus Boolean | High Boolean | Host String
  | Hostname String | Href String | Hreflang String | Hspace Number
  | HtmlFor String | HttpEquiv String | Indeterminate Boolean | InnerText String
  | IsMap Boolean | Kind String | Label String | LogDesc String | Loop Number
  | Low Number | Lowsrc String | MarginHeight String | MarginWidth String
  | Max String | MaxLength Number | Method String | Media MediaType | Min String
  | MinLength Number | Multiple Boolean | Muted Boolean | Name String
  | NoHref Boolean | NoResize Boolean | NoShade Boolean | NoWrap Boolean
  | NoValidate | Object String | Optimum String | Pathname String
  | Pattern String | PlaceHolder String | PlaybackRate Number | Port String
  | Protocol String | Profile String | ReadOnly Boolean | Rel LinkType
  | Required Boolean | Rev String | Rows String | RowSpan Number | Rules String
  | Scrolling String | Scheme String | SelectedIndex Number
  | SelectionDirection String | SelectionEnd Number | SelectionStart Number
  | Shape String | Size Number | Sizes String | ScrollAmount Number
  | ScrollDelay Number | Src String | SrcLang String | Srcset String
  | Standby String | Start Number | Step String | Summary String
  | Target TargetType | Units String | Url String | Urn String | UseMap String
  | Vspace String | ValueAsNumber Number | Value String | Version String
  | Volume Number | VAlign String | Wrap String

instance showProperty :: Show Property where
  show property = case property of
    Attr a' b' -> "Attr: " <> a' <> " " <> b'
    Key a' -> "Key: " <> show a'
    Init f -> "Init: [Function]"
    Create f -> "Create: [Function]"
    Update f -> "Update: [Function]"
    Remove f -> "Remove: [Function]"
    Destroy f -> "Destroy: [Function]"
    Prepatch f -> "PrePatch: [Function]"
    Postpatch f -> "PostPatch: [Function]"
    Insert f -> "Insert: [Function]"
    AccessKey a' -> "AccessKey: " <> show a'
    ClassName a' -> "ClassName: " <> show a'
    ContentEditable a' -> "ContentEditable: " <> show a'
    ContextMenu a' -> "ContextMenu: " <> show a'
    Data a' -> "Data: " <> show a'
    Dir a' -> "Dir: " <> show a'
    Draggable a' -> "Draggable: " <> show a'
    Dropzone a' -> "Dropzone: " <> show a'
    Hidden a' -> "Hidden: " <> show a'
    Id a' -> "Id: " <> show a'
    InnerHTML a' -> "InnerHTML: " <> show a'
    Lang a' -> "Lang: " <> show a'
    Style a' -> "Style: " <> show a'
    TabIndex a' -> "TabIndex: " <> show a'
    Title a' -> "Title: " <> show a'
    Abbr a' -> "Abbr: " <> show a'
    Axis a' -> "Axis: " <> show a'
    Accept a' -> "Accept: " <> show a'
    AcceptCharset a' -> "AcceptCharset: " <> show a'
    Action a' -> "Action: " <> show a'
    Align a' -> "Align: " <> show a'
    AllowFullscreen a' -> "AllowFullscreen: " <> show a'
    Alt a' -> "Alt: " <> show a'
    AltHtml a' -> "AltHtml: " <> show a'
    Archive a' -> "Archive: " <> show a'
    Async a' -> "Async: " <> show a'
    Autocomplete a' -> "Autocomplete: " <> show a'
    Autofocus a' -> "Autofocus: " <> show a'
    Autoplay a' -> "Autoplay: " <> show a'
    Background a' -> "Background: " <> show a'
    Behavior a' -> "Behavior: " <> show a'
    BgColor a' -> "BgColor: " <> show a'
    BgProperties a' -> "BgProperties: " <> show a'
    Border a' -> "Border: " <> show a'
    BorderColor a' -> "BorderColor: " <> show a'
    Caption _ -> "Caption: HTMLTableCaptionElement"
    CellPadding a' -> "CellPadding: " <> show a'
    Cells a' -> "Cells: HTMLCollection"
    CellSpacing a' -> "CellSpacing: " <> show a'
    Charset a' -> "Charset: " <> show a'
    Checked a' -> "Checked: " <> show a'
    Cite a' -> "Cite: " <> show a'
    Clear a' -> "Clear: " <> show a'
    Code a' -> "Code: " <> show a'
    CodeBase a' -> "CodeBase: " <> show a'
    CodeType a' -> "CodeType: " <> show a'
    Cols a' -> "Cols: " <> show a'
    ColSpan a' -> "ColSpan: " <> show a'
    Compact a' -> "Compact: " <> show a'
    Content a' -> "Content: " <> show a'
    Coords a' -> "Coords: " <> show a'
    Controls a' -> "Controls: " <> show a'
    CrossOrigin a' -> "CrossOrigin: " <> show a'
    CurrentTime a' -> "CurrentTime: " <> show a'
    Declare a' -> "Declare: " <> show a'
    Default a' -> "Default: " <> show a'
    DefaultChecked a' -> "DefaultChecked: " <> show a'
    DefaultMuted a' -> "DefaultMuted: " <> show a'
    DefaultPlaybackRate a' -> "DefaultPlaybackRate: " <> show a'
    DefaultSelected a' -> "DefaultSelected: " <> show a'
    DefaultValue a' -> "DefaultValue: " <> show a'
    Defer a' -> ":Defer " <> show a'
    Direction a' -> "Direction: " <> show a'
    Disabled a' -> "Disabled: " <> show a'
    Download a' -> "Download: " <> show a'
    Encoding a' -> "Encoding: " <> show a'
    Enctype a' -> "Enctype: " <> show a'
    Event a' -> "Event: " <> show a'
    Face a' -> "Face: " <> show a'
    FormAction a' -> "FormAction: " <> show a'
    FormEnctype a' -> "FormEnctype: " <> show a'
    FormMethod a' -> "FormMethod: " <> show a'
    FormNoValidate a' -> "FormNoValidate: " <> show a'
    FormTarget a' -> "FormTarget: " <> show a'
    Frame a' -> "Frame: " <> show a'
    FrameBorder a' -> "FrameBorder: " <> show a'
    Hash a' -> "Hash: " <> show a'
    Headers a' -> "Headers: " <> show a'
    HideFocus a' -> "HideFocus: " <> show a'
    High a' -> "High: " <> show a'
    Host a' -> "Host: " <> show a'
    Hostname a' -> "Hostname: " <> show a'
    Href a' -> "Href: " <> show a'
    Hreflang a' -> "Hreflang: " <> show a'
    Hspace a' -> "Hspace: " <> show a'
    HtmlFor a' -> "HtmlFor: " <> show a'
    HttpEquiv a' -> "HttpEquiv: " <> show a'
    Indeterminate a' -> "Indeterminate: " <> show a'
    InnerText a' -> "InnerText: " <> show a'
    IsMap a' -> "IsMap: " <> show a'
    Kind a' -> "Kind: " <> show a'
    Label a' -> "Label: " <> show a'
    LogDesc a' -> "LogDesc: " <> show a'
    Loop a' -> "Loop: " <> show a'
    Low a' -> "Low: " <> show a'
    Lowsrc a' -> "Lowsrc: " <> show a'
    MarginHeight a' -> "MarginHeight: " <> show a'
    MarginWidth a' -> "MarginWidth: " <> show a'
    Max a' -> "Max: " <> show a'
    MaxLength a' -> "MaxLength: " <> show a'
    Method a' -> "Method: " <> show a'
    Media a' -> "Media: " <> show a'
    Min a' -> "Min: " <> show a'
    MinLength a' -> "MinLength: " <> show a'
    Multiple a' -> "Multiple: " <> show a'
    Muted a' -> "Muted: " <> show a'
    Name a' -> "Name: " <> show a'
    NoHref a' -> "NoHref: " <> show a'
    NoResize a' -> "NoResize: " <> show a'
    NoShade a' -> "NoShade: " <> show a'
    NoWrap a' -> "NoWrap: " <> show a'
    NoValidate -> "NoValidate"
    Object a' -> "Object: " <> show a'
    Optimum a' -> "Optimum: " <> show a'
    Pathname a' -> "Pathname: " <> show a'
    Pattern a' -> "Pattern: " <> show a'
    PlaceHolder a' -> "PlaceHolder: " <> show a'
    PlaybackRate a' -> "PlaybackRate: " <> show a'
    Port a' -> "Port: " <> show a'
    Protocol a' -> "Protocol: " <> show a'
    Profile a' -> "Profile: " <> show a'
    ReadOnly a' -> "ReadOnly: " <> show a'
    Rel a' -> "Rel: " <> show a'
    Required a' -> "Required: " <> show a'
    Rev a' -> "Rev: " <> show a'
    Rows a' -> "Rows: " <> show a'
    RowSpan a' -> "RowSpan: " <> show a'
    Rules a' -> "Rules: " <> show a'
    ScrollAmount a' -> "ScrollAmount: " <> show a'
    Scrolling a' -> "Scrolling: " <> show a'
    Scheme a' -> "Scheme: " <> show a'
    SelectedIndex a' -> "SelectedIndex: " <> show a'
    SelectionDirection a' -> "SelectionDirection: " <> show a'
    SelectionEnd a' -> "SelectionEnd: " <> show a'
    SelectionStart a' -> "SelectionStart: " <> show a'
    Shape a' -> "Shape: " <> show a'
    Size a' -> "Size: " <> show a'
    Sizes a' -> "Sizes: " <> show a'
    ScrollDelay a' -> "ScrollDelay: " <> show a'
    Src a' -> "Src: " <> show a'
    SrcLang a' -> "SrcLang: " <> show a'
    Srcset a' -> "Srcset: " <> show a'
    Standby a' -> "Standby: " <> show a'
    Start a' -> "Start: " <> show a'
    Step a' -> "Step: " <> show a'
    Summary a' -> "Summary: " <> show a'
    Target a' -> "Target: " <> show a'
    Units a' -> "Units: " <> show a'
    Url a' -> "Url: " <> show a'
    Urn a' -> "Urn: " <> show a'
    UseMap a' -> "UseMap: " <> show a'
    Vspace a' -> "Vspace: " <> show a'
    ValueAsNumber a' -> "ValueAsNumber: " <> show a'
    Value a' -> "Value: " <> show a'
    Version a' -> "Version: " <> show a'
    Volume a' -> "Volume: " <> show a'
    VAlign a' -> "VAlign: " <> show a'
    Wrap a' -> "Wrap: " <> show a'


data LinkType = Alternate | Author | Bookmark | External | Help | Icon | License
  | Manifest | Next | NoFollow | NoOpener | NoReferrer | PingBack | Prefetch
  | Preload | Prev | Search | StyleSheet | Tag

instance showLinkType :: Show LinkType where
  show linkType = case linkType of
    Alternate -> "alternate"
    Author -> "author"
    Bookmark -> "bookmark"
    External -> "external"
    Help -> "help"
    Icon -> "icon"
    License -> "license"
    Manifest -> "manifest"
    Next -> "next"
    NoFollow -> "nofollow"
    NoOpener -> "noopener"
    NoReferrer -> "noreferrer"
    PingBack -> "pingback"
    Prefetch -> "prefetch"
    Preload -> "preload"
    Prev -> "prev"
    Search -> "search"
    StyleSheet -> "stylesheet"
    Tag -> "tag"

data TargetType = Self | Blank | Parent | Top | Iframe String

instance showTargetType :: Show TargetType where
  show targetType = case targetType of
    Self -> "_self"
    Blank -> "_blank"
    Parent -> "_parent"
    Top -> "_top"
    Iframe str -> str

data MediaType = Print | Screen | All

instance showMediaType :: Show MediaType where
  show mediaType = case mediaType of
    Print -> "print"
    Screen -> "screen"
    All -> "all"

data TagName
  = A | ABBR | ADDRESS | AREA | ARTICLE | ASIDE | AUDIO | B | BASE | BDI | BDO
  | BLOCKQUOTE | BODY | BR | BUTTON | CANVAS | CAPTION | CITE | CODE | COL
  | COLGROUP | DATA | DATALIST | DD | DEL | DETAILS | DFN | DIV | DL | DT | EM
  | EMBED | FIELDSET | FIGCAPTION | FIGURE | FOOTER | FORM | H1 | H2 | H3 | H4
  | H5 | H6 | HEAD | HEADER | HR | HTML | I | IFRAME | IMG | INPUT | INS | KBD
  | LABEL | LEGEND | LI | LINK | MAIN | MAP | MARK | META | METER | NAV
  | NOFRAMES | NOSCRIPT | OBJECT | OL | OPTGROUP | OPTION | P | PARAM | PRE
  | PROGRESS | Q | RP | RT | RTC | RUBY | S | SAMP | SCRIPT | SECTION | SELECT
  | SLOT | SMALL | SOURCE | SPAN | STRONG | STYLE | SUB | SUMMARY | SUP | TABLE
  | TBODY | TD | TEMPLATE | TEXTAREA | TFOOT | TH | THEAD | TIME | TITLE | TR
  | TRACK | U | UL | VAR | VIDEO | WBR

instance showTagName :: Show TagName where
  show name = case name of
    A -> "A"
    ABBR -> "ABBR"
    ADDRESS -> "ADDRESS"
    AREA -> "AREA"
    ARTICLE -> "ARTICLE"
    ASIDE -> "ASIDE"
    AUDIO -> "AUDIO"
    B -> "B"
    BASE -> "BASE"
    BDI -> "BDI"
    BDO -> "BDO"
    BLOCKQUOTE -> "BLOCKQUOTE"
    BODY -> "BODY"
    BR -> "BR"
    BUTTON -> "BUTTON"
    CANVAS -> "CANVAS"
    CAPTION -> "CAPTION"
    CITE -> "CITE"
    CODE -> "CODE"
    COL -> "COL"
    COLGROUP -> "COLGROUP"
    DATA -> "DATA"
    DATALIST -> "DATALIST"
    DD -> "DD"
    DEL -> "DEL"
    DETAILS -> "DETAILS"
    DFN -> "DFN"
    DIV -> "DIV"
    DL -> "DL"
    DT -> "DT"
    EM -> "EM"
    EMBED -> "EMBED"
    FIELDSET -> "FIELDSET"
    FIGCAPTION -> "FIGCAPTION"
    FIGURE -> "FIGURE"
    FOOTER -> "FOOTER"
    FORM -> "FORM"
    H1 -> "H1"
    H2 -> "H2"
    H3 -> "H3"
    H4 -> "H4"
    H5 -> "H5"
    H6 -> "H6"
    HEAD -> "HEAD"
    HEADER -> "HEADER"
    HR -> "HR"
    HTML -> "HTML"
    I -> "I"
    IFRAME -> "IFRAME"
    IMG -> "IMG"
    INPUT -> "INPUT"
    INS -> "INS"
    KBD -> "KBD"
    LABEL -> "LABEL"
    LEGEND -> "LEGEND"
    LI -> "LI"
    LINK -> "LINK"
    MAIN -> "MAIN"
    MAP -> "MAP"
    MARK -> "MARK"
    META -> "META"
    METER -> "METER"
    NAV -> "NAV"
    NOFRAMES -> "NOFRAMES"
    NOSCRIPT -> "NOSCRIPT"
    OBJECT -> "OBJECT"
    OL -> "OL"
    OPTGROUP -> "OPTGROUP"
    OPTION -> "OPTION"
    P -> "P"
    PARAM -> "PARAM"
    PRE -> "PRE"
    PROGRESS -> "PROGRESS"
    Q -> "Q"
    RP -> "RP"
    RT -> "RT"
    RTC -> "RTC"
    RUBY -> "RUBY"
    S -> "S"
    SAMP -> "SAMP"
    SCRIPT -> "SCRIPT"
    SECTION -> "SECTION"
    SELECT -> "SELECT"
    SLOT -> "SLOT"
    SMALL -> "SMALL"
    SOURCE -> "SOURCE"
    SPAN -> "SPAN"
    STRONG -> "STRONG"
    STYLE -> "STYLE"
    SUB -> "SUB"
    SUMMARY -> "SUMMARY"
    SUP -> "SUP"
    TABLE -> "TABLE"
    TBODY -> "TBODY"
    TD -> "TD"
    TEMPLATE -> "TEMPLATE"
    TEXTAREA -> "TEXTAREA"
    TFOOT -> "TFOOT"
    TH -> "TH"
    THEAD -> "THEAD"
    TIME -> "TIME"
    TITLE -> "TITLE"
    TR -> "TR"
    TRACK -> "TRACK"
    U -> "U"
    UL -> "UL"
    VAR -> "VAR"
    VIDEO -> "VIDEO"
    WBR -> "WBR"

instance eqTagName :: Eq TagName where
  eq a' b' = (show a') == (show b')

data VNode
  = TextVNode { value :: String, element :: Maybe Text }
  | ElementVNode
    { tagName :: TagName
    , properties :: Array Property
    , children :: Array VNode
    , element :: Maybe Element
    , key :: Maybe String
    }

instance eqVNode :: Eq VNode where
  eq = vNodesAreEqual

instance showVNode :: Show VNode where
  show vNode' = case vNode' of
    TextVNode vNode ->
      "{ value: " <> vNode.value <> ", element: { Text } }"
    ElementVNode vNode ->
      "{ tagName: " <> show vNode.tagName <> ", properties: " <> (show vNode.properties) <> ", children: " <> (show vNode.children) <> ", element: Maybe(Element) }"

vNodesAreEqual :: VNode -> VNode -> Boolean
vNodesAreEqual (TextVNode vNode1) (TextVNode vNode2) = vNode1.value == vNode2.value
vNodesAreEqual (ElementVNode vNode1) (ElementVNode vNode2) = vNode1.tagName == vNode2.tagName && vNode1.key == vNode2.key
vNodesAreEqual (ElementVNode _) (TextVNode _) = false
vNodesAreEqual (TextVNode _) (ElementVNode _) = false
