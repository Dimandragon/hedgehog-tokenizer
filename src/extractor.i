/* File : extractor.i */
%module extractor

%{
#include "modes_extractors.hpp"
using namespace NP_DSP;
using namespace NP_DSP::ONE_D;
using namespace NP_DSP::ONE_D::MODES_EXTRACTORS;
%}

%include stl.i

namespace std {
    %template(DoubleVector) vector<double>;
}

//%feature("valuewrapper") Foo;
%include "non-parametric-dsp/np_dsp/modes_extractors.hpp"

//using NP_DSP::ONE_D::MODES_EXTRACTORS::InstFreqNormSincExtractor;

//%extend InstFreqNormSincExtractor{
//    %template(computeVec) computeVec<std::vector<double>>;
//};
namespace NP_DSP{
    namespace ONE_D{
        namespace MODES_EXTRACTORS{
            %template(computeVec) InstFreqNormSincExtractor::compute<std::vector<double>>;
        }
    }
}
//%template(computeVec) NP_DSP::ONE_D::MODES_EXTRACTORS::InstFreqNormSincExtractor::compute<std::vector<double>>;