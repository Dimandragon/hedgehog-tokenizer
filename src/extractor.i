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
    %template(TokensVector) vector<Token>;
}

//%feature("valuewrapper") Foo;
%include "non-parametric-dsp/np_dsp/modes_extractors.hpp"
%include "non-parametric-dsp/np_dsp/tokenizer.hpp"

//using NP_DSP::ONE_D::MODES_EXTRACTORS::InstFreqNormSincExtractor;
//using NP_DSP::ONE_D::MODES_EXTRACTORS::InstFreqNormSincExtractorReq;
//using NP_DSP::ONE_D::MODES_EXTRACTORS::MakimaBasedModeDecomposition;

//using NP_DSP::ONE_D::MODES_EXTRACTORS::Tokenizers;
//using NP_DSP::ONE_D::Tokenizers::InstFreqNormSincTokenizer;
//using NP_DSP::ONE_D::Tokenizers::InstFreqNormSincReqTokenizer;
//using NP_DSP::ONE_D::Tokenizers::MakimaModeDecompositionBasedTokenizer;


namespace NP_DSP{
    namespace ONE_D{
        namespace MODES_EXTRACTORS{
            %template(computeVec) InstFreqNormSincExtractor::compute<std::vector<double>>;
            %template(computeVec) InstFreqNormSincExtractorReq::compute<std::vector<double>>;
            %template(computeVec) MakimaBasedModeDecomposition::compute<std::vector<double>>;
        }
        namespace Tokenizers{
            %template(computeVec) InstFreqNormSincTokenizer::compute<std::vector<double>>;
            %template(computeVec) InstFreqNormSincReqTokenizer::compute<std::vector<double>>;
            %template(computeVec) MakimaModeDecompositionBasedTokenizer::compute<std::vector<double>>;
        }
    }
}
