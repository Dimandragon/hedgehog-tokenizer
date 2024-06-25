/* File : extractor.i */
%module extractor

%{
#include "modes_extractors.hpp"
#include "tokenizer.hpp"
using namespace NP_DSP;
using namespace NP_DSP::ONE_D;
using namespace NP_DSP::ONE_D::MODES_EXTRACTORS;
using namespace NP_DSP::ONE_D::Tokenizers;
%}

%include stl.i

namespace std {
    %template(DoubleVector) vector<double>;
}

//%feature("valuewrapper") Foo;
%include "non-parametric-dsp/np_dsp/modes_extractors.hpp"
%include "non-parametric-dsp/np_dsp/tokenizer.hpp"

//using NP_DSP::ONE_D::MODES_EXTRACTORS::InstFreqNormSincExtractor;

//using NP_DSP::ONE_D::MODES_EXTRACTORS::Tokenizers;



namespace NP_DSP{
    namespace ONE_D{
        namespace MODES_EXTRACTORS{
            %template(computeVec) InstFreqNormSincExtractor::compute<std::vector<double>>;
        }
        namespace Tokenizers{
            %template(computeVec) InstFreqNormSincTokenizer::compute<std::vector<double>>;
        }
    }
}
