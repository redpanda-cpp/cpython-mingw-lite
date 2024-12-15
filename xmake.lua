set_languages('c11')
add_rules('mode.debug', 'mode.release')

add_defines(
  'DONT_USE_SEH',
  'Py_NO_ENABLE_SHARED',
  'UNICODE',
  '_UNICODE',
  '_WIN32_WINNT=0x0602')
add_includedirs(
  '$(buildir)',
  'Include',
  'PC')

target('python')
  set_kind('binary')
  add_deps('pythoncore')
  add_ldflags(
    '-municode',
    '-static',
    {force = true})
  add_files('Programs/python.c')

target('pythoncore')
  set_kind('static')
  add_links(
    'bcrypt',
    'pathcch',
    'version',
    'ws2_32')
  add_defines(
    'Py_BUILD_CORE',
    'Py_BUILD_CORE_BUILTIN',
    '_Py_HAVE_ZLIB')
  add_includedirs(
    'Include/internal',
    'Include/internal/mimalloc',
    'Modules/_hacl/include',
    'zlib')
  add_configfiles('PC/pyconfig.h.in')
  add_headerfiles(
    '$(buildir)/pyconfig.h',
    'Include/*.h',
    'Include/(cpython/*.h)',
    {prefixdir = 'python'})
  add_installfiles(
    'python-config.sh',
    {prefixdir = ''})
  add_installfiles(
    'Lib/(**)|__pycache__/|test/',
    {prefixdir = 'Lib'})
  add_files(
    'Modules/getpath.c',
    {
      defines = {
        'PREFIX=NULL',
        'EXEC_PREFIX=NULL',
        'VERSION=NULL',
        [[VPATH="..\\.."]],
        'PLATLIBDIR="DLLs"'},
      includedirs = {'.'},
    })
  add_files(
    'Modules/_abc.c',
    'Modules/_bisectmodule.c',
    'Modules/_blake2/blake2module.c',
    'Modules/_blake2/blake2b_impl.c',
    'Modules/_blake2/blake2s_impl.c',
    'Modules/_codecsmodule.c',
    'Modules/_collectionsmodule.c',
    'Modules/_contextvarsmodule.c',
    'Modules/_csv.c',
    'Modules/_functoolsmodule.c',
    'Modules/_hacl/Hacl_Hash_MD5.c',
    'Modules/_hacl/Hacl_Hash_SHA1.c',
    'Modules/_hacl/Hacl_Hash_SHA2.c',
    'Modules/_hacl/Hacl_Hash_SHA3.c',
    'Modules/_heapqmodule.c',
    'Modules/_json.c',
    'Modules/_localemodule.c',
    'Modules/_lsprof.c',
    'Modules/_pickle.c',
    'Modules/_randommodule.c',
    'Modules/_sre/sre.c',
    'Modules/_stat.c',
    'Modules/_struct.c',
    'Modules/_suggestions.c',
    'Modules/_weakref.c',
    'Modules/arraymodule.c',
    'Modules/atexitmodule.c')
  add_files(
    'Modules/binascii.c',
    {defines = 'USE_ZLIB_CRC32'})
  add_files(
    'Modules/cmathmodule.c',
    'Modules/_datetimemodule.c',
    'Modules/errnomodule.c',
    'Modules/faulthandler.c',
    'Modules/gcmodule.c',
    'Modules/getbuildinfo.c',
    'Modules/itertoolsmodule.c',
    'Modules/main.c',
    'Modules/mathmodule.c',
    'Modules/md5module.c',
    'Modules/mmapmodule.c',
    'Modules/_opcode.c',
    'Modules/_operator.c',
    'Modules/posixmodule.c',
    'Modules/rotatingtree.c',
    'Modules/sha1module.c',
    'Modules/sha2module.c',
    'Modules/sha3module.c',
    'Modules/signalmodule.c',
    'Modules/_statisticsmodule.c',
    'Modules/symtablemodule.c',
    'Modules/_sysconfig.c',
    'Modules/_threadmodule.c',
    'Modules/_tracemalloc.c',
    'Modules/_typingmodule.c',
    'Modules/timemodule.c',
    'Modules/xxsubtype.c',
    'Modules/_interpretersmodule.c',
    'Modules/_interpchannelsmodule.c',
    'Modules/_interpqueuesmodule.c',
    'Modules/_io/fileio.c',
    'Modules/_io/bytesio.c',
    'Modules/_io/stringio.c',
    'Modules/_io/bufferedio.c',
    'Modules/_io/iobase.c',
    'Modules/_io/textio.c',
    'Modules/_io/winconsoleio.c',
    'Modules/_io/_iomodule.c',
    'Modules/cjkcodecs/_codecs_cn.c',
    'Modules/cjkcodecs/_codecs_hk.c',
    'Modules/cjkcodecs/_codecs_iso2022.c',
    'Modules/cjkcodecs/_codecs_jp.c',
    'Modules/cjkcodecs/_codecs_kr.c',
    'Modules/cjkcodecs/_codecs_tw.c',
    'Modules/cjkcodecs/multibytecodec.c',
    'Modules/_winapi.c',
    'Objects/abstract.c',
    'Objects/boolobject.c',
    'Objects/bytearrayobject.c',
    'Objects/bytes_methods.c',
    'Objects/bytesobject.c',
    'Objects/call.c',
    'Objects/capsule.c',
    'Objects/cellobject.c',
    'Objects/classobject.c',
    'Objects/codeobject.c',
    'Objects/complexobject.c',
    'Objects/descrobject.c',
    'Objects/dictobject.c',
    'Objects/enumobject.c',
    'Objects/exceptions.c',
    'Objects/fileobject.c',
    'Objects/floatobject.c',
    'Objects/frameobject.c',
    'Objects/funcobject.c',
    'Objects/genericaliasobject.c',
    'Objects/genobject.c',
    'Objects/iterobject.c',
    'Objects/listobject.c',
    'Objects/longobject.c',
    'Objects/memoryobject.c',
    'Objects/methodobject.c',
    'Objects/moduleobject.c',
    'Objects/namespaceobject.c',
    'Objects/object.c',
    'Objects/obmalloc.c',
    'Objects/odictobject.c',
    'Objects/picklebufobject.c',
    'Objects/rangeobject.c',
    'Objects/setobject.c',
    'Objects/sliceobject.c',
    'Objects/structseq.c',
    'Objects/tupleobject.c',
    'Objects/typeobject.c',
    'Objects/typevarobject.c',
    'Objects/unicodectype.c',
    'Objects/unicodeobject.c',
    'Objects/unionobject.c',
    'Objects/weakrefobject.c',
    'Parser/myreadline.c',
    'Parser/lexer/state.c',
    'Parser/lexer/lexer.c',
    'Parser/lexer/buffer.c',
    'Parser/tokenizer/string_tokenizer.c',
    'Parser/tokenizer/file_tokenizer.c',
    'Parser/tokenizer/utf8_tokenizer.c',
    'Parser/tokenizer/readline_tokenizer.c',
    'Parser/tokenizer/helpers.c',
    'Parser/token.c',
    'Parser/pegen.c',
    'Parser/pegen_errors.c',
    'Parser/action_helpers.c',
    'Parser/parser.c',
    'Parser/string_parser.c',
    'Parser/peg_api.c',
    'PC/invalid_parameter_handler.c',
    'PC/winreg.c',
    'PC/config.c',
    'PC/msvcrtmodule.c',
    'Python/pyhash.c',
    'Python/_warnings.c',
    'Python/asdl.c',
    'Python/assemble.c',
    'Python/ast.c',
    'Python/ast_opt.c',
    'Python/ast_unparse.c',
    'Python/bltinmodule.c',
    'Python/bootstrap_hash.c',
    'Python/brc.c',
    'Python/ceval.c',
    'Python/codecs.c',
    'Python/compile.c',
    'Python/context.c',
    'Python/critical_section.c',
    'Python/crossinterp.c',
    'Python/dynamic_annotations.c',
    'Python/dynload_win.c',
    'Python/errors.c',
    'Python/fileutils.c',
    'Python/flowgraph.c',
    'Python/formatter_unicode.c',
    'Python/frame.c',
    'Python/frozen.c',
    'Python/future.c',
    'Python/gc.c',
    'Python/gc_free_threading.c',
    'Python/gc_gil.c',
    'Python/getargs.c',
    'Python/getcompiler.c',
    'Python/getcopyright.c',
    'Python/getopt.c',
    'Python/getplatform.c',
    'Python/getversion.c',
    'Python/ceval_gil.c',
    'Python/hamt.c',
    'Python/hashtable.c',
    'Python/import.c',
    'Python/importdl.c',
    'Python/initconfig.c',
    'Python/interpconfig.c',
    'Python/intrinsics.c',
    'Python/instruction_sequence.c',
    'Python/instrumentation.c',
    'Python/jit.c',
    'Python/legacy_tracing.c',
    'Python/lock.c',
    'Python/marshal.c',
    'Python/modsupport.c',
    'Python/mysnprintf.c',
    'Python/mystrtoul.c',
    'Python/object_stack.c',
    'Python/optimizer.c',
    'Python/optimizer_analysis.c',
    'Python/optimizer_symbols.c',
    'Python/parking_lot.c',
    'Python/pathconfig.c',
    'Python/perf_trampoline.c',
    'Python/perf_jit_trampoline.c',
    'Python/preconfig.c',
    'Python/pyarena.c',
    'Python/pyctype.c',
    'Python/pyfpe.c',
    'Python/pylifecycle.c',
    'Python/pymath.c',
    'Python/pytime.c',
    'Python/pystate.c',
    'Python/pystrcmp.c',
    'Python/pystrhex.c',
    'Python/pystrtod.c',
    'Python/qsbr.c',
    'Python/dtoa.c',
    'Python/Python-ast.c',
    'Python/Python-tokenize.c',
    'Python/pythonrun.c',
    'Python/specialize.c',
    'Python/suggestions.c',
    'Python/structmember.c',
    'Python/symtable.c')
  add_files(
    'Python/sysmodule.c',
    {defines = [[VPATH="..\\.."]]})
  add_files(
    'Python/thread.c',
    'Python/traceback.c',
    'Python/tracemalloc.c')
  add_files(
    'Modules/zlibmodule.c',
    'zlib/adler32.c',
    'zlib/compress.c',
    'zlib/crc32.c',
    'zlib/deflate.c',
    'zlib/infback.c',
    'zlib/inffast.c',
    'zlib/inflate.c',
    'zlib/inftrees.c',
    'zlib/trees.c',
    'zlib/uncompr.c',
    'zlib/zutil.c')

  before_build(function (target)
    local modules = {
      {'getpath', 'Modules/getpath.py', 'Python/frozen_modules/getpath.h'},
      {'importlib._bootstrap', 'Lib/importlib/_bootstrap.py', 'Python/frozen_modules/importlib._bootstrap.h'},
      {'importlib._bootstrap_external', 'Lib/importlib/_bootstrap_external.py', 'Python/frozen_modules/importlib._bootstrap_external.h'},
      {'zipimport', 'Lib/zipimport.py', 'Python/frozen_modules/zipimport.h'},
      {'abc', 'Lib/abc.py', 'Python/frozen_modules/abc.h'},
      {'codecs', 'Lib/codecs.py', 'Python/frozen_modules/codecs.h'},
      {'io', 'Lib/io.py', 'Python/frozen_modules/io.h'},
      {'_collections_abc', 'Lib/_collections_abc.py', 'Python/frozen_modules/_collections_abc.h'},
      {'_sitebuiltins', 'Lib/_sitebuiltins.py', 'Python/frozen_modules/_sitebuiltins.h'},
      {'genericpath', 'Lib/genericpath.py', 'Python/frozen_modules/genericpath.h'},
      {'ntpath', 'Lib/ntpath.py', 'Python/frozen_modules/ntpath.h'},
      {'posixpath', 'Lib/posixpath.py', 'Python/frozen_modules/posixpath.h'},
      {'os', 'Lib/os.py', 'Python/frozen_modules/os.h'},
      {'site', 'Lib/site.py', 'Python/frozen_modules/site.h'},
      {'stat', 'Lib/stat.py', 'Python/frozen_modules/stat.h'},
      {'importlib.util', 'Lib/importlib/util.py', 'Python/frozen_modules/importlib.util.h'},
      {'importlib.machinery', 'Lib/importlib/machinery.py', 'Python/frozen_modules/importlib.machinery.h'},
      {'runpy', 'Lib/runpy.py', 'Python/frozen_modules/runpy.h'},
      {'__hello__', 'Lib/__hello__.py', 'Python/frozen_modules/__hello__.h'},
      {'__phello__', 'Lib/__phello__/__init__.py', 'Python/frozen_modules/__phello__.h'},
      {'__phello__.ham', 'Lib/__phello__/ham/__init__.py', 'Python/frozen_modules/__phello__.ham.h'},
      {'__phello__.ham.eggs', 'Lib/__phello__/ham/eggs.py', 'Python/frozen_modules/__phello__.ham.eggs.h'},
      {'__phello__.spam', 'Lib/__phello__/spam.py', 'Python/frozen_modules/__phello__.spam.h'},
      {'frozen_only', 'Tools/freeze/flag.py', 'Python/frozen_modules/frozen_only.h'},
    }
    for _, module in ipairs(modules) do
      os.execv('python3.13', {'Programs/_freeze_module.py', module[1], module[2], module[3]})
    end
  end)
