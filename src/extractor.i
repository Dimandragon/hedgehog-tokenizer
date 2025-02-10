/* File : extractor.i */
%module extractor

%{
#include "modes_extractors.hpp"
#include "tokenizer.hpp"
using namespace NP_DSP;
using namespace NP_DSP::ONE_D;
using namespace NP_DSP::ONE_D::MODES_EXTRACTORS;
using namespace NP_DSP::ONE_D::Tokenizers;
using namespace NP_DSP::ONE_D::PHASE_SHIFTERS;
using namespace NP_DSP::ONE_D::FILTERS;
%}

%include stl.i

namespace std {
    %template(DoubleVector) vector<double>;
    %template(TokensVector) vector<Token>;
}

//%feature("valuewrapper") Foo;
%include "non-parametric-dsp/np_dsp/modes_extractors.hpp"
%include "non-parametric-dsp/np_dsp/tokenizer.hpp"
%include "non-parametric-dsp/np_dsp/filters.hpp"
%include "non-parametric-dsp/np_dsp/phase_shifters.hpp"

//using NP_DSP::ONE_D::MODES_EXTRACTORS::SOTAEMD;

//using NP_DSP::ONE_D::MODES_EXTRACTORS::Tokenizers;
//using NP_DSP::ONE_D::Tokenizers::InstFreqNormSincTokenizer;
//using NP_DSP::ONE_D::Tokenizers::InstFreqNormSincReqTokenizer;
//using NP_DSP::ONE_D::Tokenizers::MakimaModeDecompositionBasedTokenizer;
//using NP_DSP::ONE_D::Tokenizers::SOTAEMDBasedTokenizer;

//using NP_DSP::ONE_D::PHASE_SHIFTERS::RotateKind;
//using NP_DSP::ONE_D::FILTERS::InterpolationKind;


namespace NP_DSP{
    namespace ONE_D{
        namespace MODES_EXTRACTORS{
            %template(computeVec) SOTAEMD::compute<std::vector<double>>;
        }
        namespace Tokenizers{
            %template(computeVec) InstFreqNormSincTokenizer::compute<std::vector<double>>;
            %template(computeVec) InstFreqNormSincReqTokenizer::compute<std::vector<double>>;
            %template(computeVec) MakimaModeDecompositionBasedTokenizer::compute<std::vector<double>>;
            %template(computeVec) SOTAEMDBasedTokenizer::compute<std::vector<double>>;
        }
    }
}
