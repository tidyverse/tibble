# BoomSpikeSlab

Version: 1.0.0

## Newly broken

*   checking whether package ‘BoomSpikeSlab’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/RtmpcwuZam/filefddc2a267413/BoomSpikeSlab.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘BoomSpikeSlab’ ...
** package ‘BoomSpikeSlab’ successfully unpacked and MD5 sums checked
** libs
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfddc45ae37dc/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c boom_spike_slab_init.cc -o boom_spike_slab_init.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfddc45ae37dc/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c poisson_spike_slab_wrapper.cc -o poisson_spike_slab_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
Error in readRDS("/tmp/RtmpcwuZam/filefddc27b2aa6e") : 
  error reading from connection
Calls: .Last -> readRDS
g++: error: traceback(1): No such file or directory
g++: error: 2:: No such file or directory
g++: error: readRDS("/tmp/RtmpcwuZam/filefddc27b2aa6e"): No such file or directory
g++: error: 1:: No such file or directory
g++: error: .Last()/include: No such file or directory
/usr/lib/R/etc/Makeconf:166: recipe for target 'poisson_spike_slab_wrapper.o' failed
make: *** [poisson_spike_slab_wrapper.o] Error 1
make: *** Waiting for unfinished jobs....
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfddc45ae37dc/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c probit_spike_slab_wrapper.cc -o probit_spike_slab_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfddc45ae37dc/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c nested_regression_wrapper.cc -o nested_regression_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfddc45ae37dc/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c shrinkage_regression_wrapper.cc -o shrinkage_regression_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfddc45ae37dc/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c mlm_spike_slab_wrapper.cc -o mlm_spike_slab_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfddc45ae37dc/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c spike_slab_wrapper.cc -o spike_slab_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfddc45ae37dc/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c quantile_spike_wrapper.cc -o quantile_spike_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfddc45ae37dc/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c logit_spike_slab_wrapper.cc -o logit_spike_slab_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
ERROR: compilation failed for package ‘BoomSpikeSlab’
* removing ‘/tmp/RtmpcwuZam/filefddc2a267413/BoomSpikeSlab.Rcheck/BoomSpikeSlab’

```
### CRAN

```
* installing *source* package ‘BoomSpikeSlab’ ...
** package ‘BoomSpikeSlab’ successfully unpacked and MD5 sums checked
** libs
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfdc9643c9068/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c boom_spike_slab_init.cc -o boom_spike_slab_init.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfdc9643c9068/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c nested_regression_wrapper.cc -o nested_regression_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfdc9643c9068/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c probit_spike_slab_wrapper.cc -o probit_spike_slab_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfdc9643c9068/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c poisson_spike_slab_wrapper.cc -o poisson_spike_slab_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfdc9643c9068/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c shrinkage_regression_wrapper.cc -o shrinkage_regression_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfdc9643c9068/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c mlm_spike_slab_wrapper.cc -o mlm_spike_slab_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfdc9643c9068/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c logit_spike_slab_wrapper.cc -o logit_spike_slab_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfdc9643c9068/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c quantile_spike_wrapper.cc -o quantile_spike_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE -I"/tmp/RtmpcwuZam/checklibfdc9643c9068/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c spike_slab_wrapper.cc -o spike_slab_wrapper.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
g++ -std=gnu++11 -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o BoomSpikeSlab.so boom_spike_slab_init.o logit_spike_slab_wrapper.o mlm_spike_slab_wrapper.o nested_regression_wrapper.o poisson_spike_slab_wrapper.o probit_spike_slab_wrapper.o quantile_spike_wrapper.o shrinkage_regression_wrapper.o spike_slab_wrapper.o /tmp/RtmpcwuZam/checklibfdc9643c9068/Boom/lib/libboom.a -L/usr/lib/R/lib -lR
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB} 
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE
CXX_STD = CXX11
installing to /tmp/RtmpcwuZam/filefdc949a00d82/BoomSpikeSlab.Rcheck/BoomSpikeSlab/libs
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded
* DONE (BoomSpikeSlab)

```
