# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `builder` gem.
# Please instead update this file by running `bin/tapioca gem builder`.

# If the Builder::XChar module is not currently defined, fail on any
# name clashes in standard library classes.
#
# source://builder//lib/builder/xmlbase.rb#4
module Builder
  class << self
    # source://builder//lib/builder/xchar.rb#13
    def check_for_name_collision(klass, method_name, defined_constant = T.unsafe(nil)); end
  end
end

# Generic error for builder
#
# source://builder//lib/builder/xmlbase.rb#7
class Builder::IllegalBlockError < ::RuntimeError; end

# source://builder//lib/builder/xchar.rb#33
module Builder::XChar
  class << self
    # encode a string per XML rules
    #
    # source://builder//lib/builder/xchar.rb#152
    def encode(string); end

    # convert a string to valid UTF-8, compensating for a number of
    # common errors.
    #
    # source://builder//lib/builder/xchar.rb#126
    def unicode(string); end
  end
end

# See
# http://intertwingly.net/stories/2004/04/14/i18n.html#CleaningWindows
# for details.
#
# source://builder//lib/builder/xchar.rb#38
Builder::XChar::CP1252 = T.let(T.unsafe(nil), Hash)

# source://builder//lib/builder/xchar.rb#100
Builder::XChar::CP1252_DIFFERENCES = T.let(T.unsafe(nil), String)

# source://builder//lib/builder/xchar.rb#120
Builder::XChar::ENCODING_BINARY = T.let(T.unsafe(nil), Encoding)

# source://builder//lib/builder/xchar.rb#122
Builder::XChar::ENCODING_ISO1 = T.let(T.unsafe(nil), Encoding)

# source://builder//lib/builder/xchar.rb#121
Builder::XChar::ENCODING_UTF8 = T.let(T.unsafe(nil), Encoding)

# source://builder//lib/builder/xchar.rb#109
Builder::XChar::INVALID_XML_CHAR = T.let(T.unsafe(nil), Regexp)

# See http://www.w3.org/TR/REC-xml/#dt-chardata for details.
#
# source://builder//lib/builder/xchar.rb#69
Builder::XChar::PREDEFINED = T.let(T.unsafe(nil), Hash)

# http://www.fileformat.info/info/unicode/char/fffd/index.htm
#
# source://builder//lib/builder/xchar.rb#84
Builder::XChar::REPLACEMENT_CHAR = T.let(T.unsafe(nil), String)

# source://builder//lib/builder/xchar.rb#100
Builder::XChar::UNICODE_EQUIVALENT = T.let(T.unsafe(nil), String)

# See http://www.w3.org/TR/REC-xml/#charsets for details.
#
# source://builder//lib/builder/xchar.rb#76
Builder::XChar::VALID = T.let(T.unsafe(nil), Array)

# source://builder//lib/builder/xchar.rb#105
Builder::XChar::XML_PREDEFINED = T.let(T.unsafe(nil), Regexp)

# XmlBase is a base class for building XML builders.  See
# Builder::XmlMarkup and Builder::XmlEvents for examples.
#
# source://builder//lib/builder/xmlbase.rb#11
class Builder::XmlBase < ::BasicObject
  # Create an XML markup builder.
  #
  # out      :: Object receiving the markup.  +out+ must respond to
  #             <tt><<</tt>.
  # indent   :: Number of spaces used for indentation (0 implies no
  #             indentation and no line breaks).
  # initial  :: Level of initial indentation.
  # encoding :: When <tt>encoding</tt> and $KCODE are set to 'utf-8'
  #             characters aren't converted to character entities in
  #             the output stream.
  #
  # @return [XmlBase] a new instance of XmlBase
  #
  # source://builder//lib/builder/xmlbase.rb#27
  def initialize(indent = T.unsafe(nil), initial = T.unsafe(nil), encoding = T.unsafe(nil)); end

  # Append text to the output target without escaping any markup.
  # May be used within the markup brackets as:
  #
  #   builder.p { |x| x << "<br/>HI" }   #=>  <p><br/>HI</p>
  #
  # This is useful when using non-builder enabled software that
  # generates strings.  Just insert the string directly into the
  # builder without changing the inserted markup.
  #
  # It is also useful for stacking builder objects.  Builders only
  # use <tt><<</tt> to append to the target, so by supporting this
  # method/operation builders can use other builders as their
  # targets.
  #
  # source://builder//lib/builder/xmlbase.rb#116
  def <<(text); end

  # @return [Boolean]
  #
  # source://builder//lib/builder/xmlbase.rb#33
  def explicit_nil_handling?; end

  # Create XML markup based on the name of the method.  This method
  # is never invoked directly, but is called for each markup method
  # in the markup block that isn't cached.
  #
  # source://builder//lib/builder/xmlbase.rb#90
  def method_missing(sym, *args, &block); end

  # For some reason, nil? is sent to the XmlMarkup object.  If nil?
  # is not defined and method_missing is invoked, some strange kind
  # of recursion happens.  Since nil? won't ever be an XML tag, it
  # is pretty safe to define it here. (Note: this is an example of
  # cargo cult programming,
  # cf. http://fishbowl.pastiche.org/2004/10/13/cargo_cult_programming).
  #
  # @return [Boolean]
  #
  # source://builder//lib/builder/xmlbase.rb#126
  def nil?; end

  # Create a tag named +sym+.  Other than the first argument which
  # is the tag name, the arguments are the same as the tags
  # implemented via <tt>method_missing</tt>.
  #
  # source://builder//lib/builder/xmlbase.rb#40
  def tag!(sym, *args, &block); end

  # Append text to the output target.  Escape any markup.  May be
  # used within the markup brackets as:
  #
  #   builder.p { |b| b.br; b.text! "HI" }   #=>  <p><br/>HI</p>
  #
  # source://builder//lib/builder/xmlbase.rb#99
  def text!(text); end

  private

  # source://builder//lib/builder/xmlbase.rb#134
  def _escape(text); end

  # source://builder//lib/builder/xmlbase.rb#157
  def _escape_attribute(text); end

  # source://builder//lib/builder/xmlbase.rb#167
  def _indent; end

  # source://builder//lib/builder/xmlbase.rb#172
  def _nested_structures(block); end

  # source://builder//lib/builder/xmlbase.rb#162
  def _newline; end

  # If XmlBase.cache_method_calls = true, we dynamicly create the method
  # missed as an instance method on the XMLBase object. Because XML
  # documents are usually very repetative in nature, the next node will
  # be handled by the new method instead of method_missing. As
  # method_missing is very slow, this speeds up document generation
  # significantly.
  #
  # source://builder//lib/builder/xmlbase.rb#185
  def cache_method_call(sym); end

  class << self
    # Returns the value of attribute cache_method_calls.
    #
    # source://builder//lib/builder/xmlbase.rb#14
    def cache_method_calls; end

    # Sets the attribute cache_method_calls
    #
    # @param value the value to set the attribute cache_method_calls to.
    #
    # source://builder//lib/builder/xmlbase.rb#14
    def cache_method_calls=(_arg0); end
  end
end

# Create a series of SAX-like XML events (e.g. start_tag, end_tag)
# from the markup code.  XmlEvent objects are used in a way similar
# to XmlMarkup objects, except that a series of events are generated
# and passed to a handler rather than generating character-based
# markup.
#
# Usage:
#   xe = Builder::XmlEvents.new(hander)
#   xe.title("HI")    # Sends start_tag/end_tag/text messages to the handler.
#
# Indentation may also be selected by providing value for the
# indentation size and initial indentation level.
#
#   xe = Builder::XmlEvents.new(handler, indent_size, initial_indent_level)
#
# == XML Event Handler
#
# The handler object must expect the following events.
#
# [<tt>start_tag(tag, attrs)</tt>]
#     Announces that a new tag has been found.  +tag+ is the name of
#     the tag and +attrs+ is a hash of attributes for the tag.
#
# [<tt>end_tag(tag)</tt>]
#     Announces that an end tag for +tag+ has been found.
#
# [<tt>text(text)</tt>]
#     Announces that a string of characters (+text+) has been found.
#     A series of characters may be broken up into more than one
#     +text+ call, so the client cannot assume that a single
#     callback contains all the text data.
#
# source://builder//lib/builder/xmlevents.rb#49
class Builder::XmlEvents < ::Builder::XmlMarkup
  # source://builder//lib/builder/xmlevents.rb#59
  def _end_tag(sym); end

  # source://builder//lib/builder/xmlevents.rb#54
  def _start_tag(sym, attrs, end_too = T.unsafe(nil)); end

  # source://builder//lib/builder/xmlevents.rb#50
  def text!(text); end
end

# Create XML markup easily.  All (well, almost all) methods sent to
# an XmlMarkup object will be translated to the equivalent XML
# markup.  Any method with a block will be treated as an XML markup
# tag with nested markup in the block.
#
# Examples will demonstrate this easier than words.  In the
# following, +xm+ is an +XmlMarkup+ object.
#
#   xm.em("emphasized")            # => <em>emphasized</em>
#   xm.em { xm.b("emp & bold") }   # => <em><b>emph &amp; bold</b></em>
#   xm.a("A Link", "href"=>"http://onestepback.org")
#                                  # => <a href="http://onestepback.org">A Link</a>
#   xm.div { xm.br }               # => <div><br/></div>
#   xm.target("name"=>"compile", "option"=>"fast")
#                                  # => <target option="fast" name="compile"\>
#                                  # NOTE: order of attributes is not specified.
#
#   xm.instruct!                   # <?xml version="1.0" encoding="UTF-8"?>
#   xm.html {                      # <html>
#     xm.head {                    #   <head>
#       xm.title("History")        #     <title>History</title>
#     }                            #   </head>
#     xm.body {                    #   <body>
#       xm.comment! "HI"           #     <!-- HI -->
#       xm.h1("Header")            #     <h1>Header</h1>
#       xm.p("paragraph")          #     <p>paragraph</p>
#     }                            #   </body>
#   }                              # </html>
#
# == Notes:
#
# * The order that attributes are inserted in markup tags is
#   undefined.
#
# * Sometimes you wish to insert text without enclosing tags.  Use
#   the <tt>text!</tt> method to accomplish this.
#
#   Example:
#
#     xm.div {                          # <div>
#       xm.text! "line"; xm.br          #   line<br/>
#       xm.text! "another line"; xmbr   #    another line<br/>
#     }                                 # </div>
#
# * The special XML characters <, >, and & are converted to &lt;,
#   &gt; and &amp; automatically.  Use the <tt><<</tt> operation to
#   insert text without modification.
#
# * Sometimes tags use special characters not allowed in ruby
#   identifiers.  Use the <tt>tag!</tt> method to handle these
#   cases.
#
#   Example:
#
#     xml.tag!("SOAP:Envelope") { ... }
#
#   will produce ...
#
#     <SOAP:Envelope> ... </SOAP:Envelope>"
#
#   <tt>tag!</tt> will also take text and attribute arguments (after
#   the tag name) like normal markup methods.  (But see the next
#   bullet item for a better way to handle XML namespaces).
#
# * Direct support for XML namespaces is now available.  If the
#   first argument to a tag call is a symbol, it will be joined to
#   the tag to produce a namespace:tag combination.  It is easier to
#   show this than describe it.
#
#     xml.SOAP :Envelope do ... end
#
#   Just put a space before the colon in a namespace to produce the
#   right form for builder (e.g. "<tt>SOAP:Envelope</tt>" =>
#   "<tt>xml.SOAP :Envelope</tt>")
#
# * XmlMarkup builds the markup in any object (called a _target_)
#   that accepts the <tt><<</tt> method.  If no target is given,
#   then XmlMarkup defaults to a string target.
#
#   Examples:
#
#     xm = Builder::XmlMarkup.new
#     result = xm.title("yada")
#     # result is a string containing the markup.
#
#     buffer = ""
#     xm = Builder::XmlMarkup.new(buffer)
#     # The markup is appended to buffer (using <<)
#
#     xm = Builder::XmlMarkup.new(STDOUT)
#     # The markup is written to STDOUT (using <<)
#
#     xm = Builder::XmlMarkup.new
#     x2 = Builder::XmlMarkup.new(:target=>xm)
#     # Markup written to +x2+ will be send to +xm+.
#
# * Indentation is enabled by providing the number of spaces to
#   indent for each level as a second argument to XmlBuilder.new.
#   Initial indentation may be specified using a third parameter.
#
#   Example:
#
#     xm = Builder::XmlMarkup.new(:indent=>2)
#     # xm will produce nicely formatted and indented XML.
#
#     xm = Builder::XmlMarkup.new(:indent=>2, :margin=>4)
#     # xm will produce nicely formatted and indented XML with 2
#     # spaces per indent and an over all indentation level of 4.
#
#     builder = Builder::XmlMarkup.new(:target=>$stdout, :indent=>2)
#     builder.name { |b| b.first("Jim"); b.last("Weirich") }
#     # prints:
#     #     <name>
#     #       <first>Jim</first>
#     #       <last>Weirich</last>
#     #     </name>
#
# * The instance_eval implementation which forces self to refer to
#   the message receiver as self is now obsolete.  We now use normal
#   block calls to execute the markup block.  This means that all
#   markup methods must now be explicitly send to the xml builder.
#   For instance, instead of
#
#      xml.div { strong("text") }
#
#   you need to write:
#
#      xml.div { xml.strong("text") }
#
#   Although more verbose, the subtle change in semantics within the
#   block was found to be prone to error.  To make this change a
#   little less cumbersome, the markup block now gets the markup
#   object sent as an argument, allowing you to use a shorter alias
#   within the block.
#
#   For example:
#
#     xml_builder = Builder::XmlMarkup.new
#     xml_builder.div { |xml|
#       xml.strong("text")
#     }
#
# source://builder//lib/builder/xmlmarkup.rb#161
class Builder::XmlMarkup < ::Builder::XmlBase
  # Create an XML markup builder.  Parameters are specified by an
  # option hash.
  #
  # :target => <em>target_object</em>::
  #    Object receiving the markup.  +target_object+ must respond to
  #    the <tt><<(<em>a_string</em>)</tt> operator and return
  #    itself.  The default target is a plain string target.
  #
  # :indent => <em>indentation</em>::
  #    Number of spaces used for indentation.  The default is no
  #    indentation and no line breaks.
  #
  # :margin => <em>initial_indentation_level</em>::
  #    Amount of initial indentation (specified in levels, not
  #    spaces).
  #
  # :quote => <em>:single</em>::
  #    Use single quotes for attributes rather than double quotes.
  #
  # :escape_attrs => <em>OBSOLETE</em>::
  #    The :escape_attrs option is no longer supported by builder
  #    (and will be quietly ignored).  String attribute values are
  #    now automatically escaped.  If you need unescaped attribute
  #    values (perhaps you are using entities in the attribute
  #    values), then give the value as a Symbol.  This allows much
  #    finer control over escaping attribute values.
  #
  # @return [XmlMarkup] a new instance of XmlMarkup
  #
  # source://builder//lib/builder/xmlmarkup.rb#190
  def initialize(options = T.unsafe(nil)); end

  # Insert a CDATA section into the XML markup.
  #
  # For example:
  #
  #    xml.cdata!("text to be included in cdata")
  #        #=> <![CDATA[text to be included in cdata]]>
  #
  # source://builder//lib/builder/xmlmarkup.rb#270
  def cdata!(text); end

  # source://builder//lib/builder/xmlmarkup.rb#275
  def cdata_value!(open, text); end

  # source://builder//lib/builder/xmlmarkup.rb#204
  def comment!(comment_text); end

  # Insert an XML declaration into the XML markup.
  #
  # For example:
  #
  #   xml.declare! :ELEMENT, :blah, "yada"
  #       # => <!ELEMENT blah "yada">
  #
  # source://builder//lib/builder/xmlmarkup.rb#215
  def declare!(inst, *args, &block); end

  # Insert a processing instruction into the XML markup.  E.g.
  #
  # For example:
  #
  #    xml.instruct!
  #        #=> <?xml version="1.0" encoding="UTF-8"?>
  #    xml.instruct! :aaa, :bbb=>"ccc"
  #        #=> <?aaa bbb="ccc"?>
  #
  # Note: If the encoding is setup to "UTF-8" and the value of
  # $KCODE is "UTF8", then builder will emit UTF-8 encoded strings
  # rather than the entity encoding normally used.
  #
  # source://builder//lib/builder/xmlmarkup.rb#248
  def instruct!(directive_tag = T.unsafe(nil), attrs = T.unsafe(nil)); end

  # Return the target of the builder.
  #
  # source://builder//lib/builder/xmlmarkup.rb#200
  def target!; end

  private

  # source://builder//lib/builder/xmlmarkup.rb#326
  def _attr_value(value); end

  # Insert an ending tag.
  #
  # source://builder//lib/builder/xmlmarkup.rb#310
  def _end_tag(sym); end

  # source://builder//lib/builder/xmlmarkup.rb#335
  def _ensure_no_block(got_block); end

  # Insert the attributes (given in the hash).
  #
  # source://builder//lib/builder/xmlmarkup.rb#315
  def _insert_attributes(attrs, order = T.unsafe(nil)); end

  # Insert special instruction.
  #
  # source://builder//lib/builder/xmlmarkup.rb#291
  def _special(open, close, data = T.unsafe(nil), attrs = T.unsafe(nil), order = T.unsafe(nil)); end

  # Start an XML tag.  If <tt>end_too</tt> is true, then the start
  # tag is also the end tag (e.g.  <br/>
  #
  # source://builder//lib/builder/xmlmarkup.rb#302
  def _start_tag(sym, attrs, end_too = T.unsafe(nil)); end

  # Insert text directly in to the builder's target.
  #
  # source://builder//lib/builder/xmlmarkup.rb#286
  def _text(text); end
end
