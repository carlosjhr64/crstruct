require 'crstruct'
include CRStruct

# IRB Tools
require 'irbtools/configure'
_ = CRStruct::VERSION.split('.')[0..1].join('.')
Irbtools.welcome_message = "### CRStruct(#{_}) ###"
require 'irbtools'
IRB.conf[:PROMPT][:CRStruct] = {
  PROMPT_I:    '> ',
  PROMPT_N:    '| ',
  PROMPT_C:    '| ',
  PROMPT_S:    '| ',
  RETURN:      "=> %s \n",
  AUTO_INDENT: true,
}
IRB.conf[:PROMPT_MODE] = :CRStruct
