includes("non-parametric-dsp/xmake.lua")

add_rules("mode.debug", "mode.release")

set_languages("c++23")
add_requires("python 3.x")

--target("shared_lib")
    --set_kind("shared")
    --add_includedirs("$(projectdir)/non-parametric_dsp/pocketfft", {public = true})
    --add_includedirs("$(projectdir)/non-parametric_dsp/np_dsp", {public = true})
    --add_headerfiles("non-parametric_dsp/pocketfft/*.h")
    --add_headerfiles("non-parametric_dsp/pocketfft/*.hpp")
    --add_headerfiles("non-parametric_dsp/np_dsp/*.h")
    --add_headerfiles("non-parametric_dsp/np_dsp/*.hpp")
    --add_files("src/extractor_wrap.cxx")
    --add_packages("python")
    --add_deps("non-parametric_dsp")


target("extractor")
    add_rules("swig.cpp", {moduletype = "python"})
    add_files("src/extractor.i", {scriptdir = "share"})
    add_packages("python")
    add_deps("non-parametric_dsp")

