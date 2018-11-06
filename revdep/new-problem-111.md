# a go at building the static library here.
(cd ./osqp && \
	make CC="gcc -std=gnu99" \
	OSQP_FLAGS="-DR_LANG=TRUE" \
	R_INCLUDE_DIR="/usr/share/R/include" CFLAGS="-g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g " \
	CPICFLAGS="-fpic" ARFLAGS="rv" \
	AR="ar" RANLIB="ranlib" \
	&& make clean)
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
cp ../qdldl_types_R.h ../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include/qdldl_types.h
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
cp ../osqp_configure_R.h ../osqp_sources//include/osqp_configure.h
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
mkdir -p ./include/osqp/
cp ../osqp_sources//include/*.h ./include/osqp/
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//src/proj.c -o ../osqp_sources//src/proj.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_valid.c -o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_valid.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_info.c -o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_info.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//src/scaling.c -o ../osqp_sources//src/scaling.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//src/polish.c -o ../osqp_sources//src/polish.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_1.c -o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_1.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/lib_handler.c -o ../osqp_sources//lin_sys/lib_handler.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_defaults.c -o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_defaults.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//src/ctrlc.c -o ../osqp_sources//src/ctrlc.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_preprocess.c -o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_preprocess.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/src/qdldl.c -o ../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/src/qdldl.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_order.c -o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_order.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/qdldl/qdldl_interface.c -o ../osqp_sources//lin_sys/direct/qdldl/qdldl_interface.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//src/lin_sys.c -o ../osqp_sources//src/lin_sys.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_post_tree.c -o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_post_tree.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//src/kkt.c -o ../osqp_sources//src/kkt.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_control.c -o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_control.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_aat.c -o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_aat.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/pardiso/pardiso_interface.c -o ../osqp_sources//lin_sys/direct/pardiso/pardiso_interface.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/qdldl/amd/src/SuiteSparse_config.c -o ../osqp_sources//lin_sys/direct/qdldl/amd/src/SuiteSparse_config.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/pardiso/pardiso_loader.c -o ../osqp_sources//lin_sys/direct/pardiso/pardiso_loader.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_postorder.c -o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_postorder.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//src/util.c -o ../osqp_sources//src/util.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//src/lin_alg.c -o ../osqp_sources//src/lin_alg.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_2.c -o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_2.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//src/cs.c -o ../osqp_sources//src/cs.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//src/osqp.c -o ../osqp_sources//src/osqp.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
gcc -std=gnu99 -I../osqp_sources//include -I../osqp_sources//lin_sys -I../osqp_sources//lin_sys/direct/pardiso -I../osqp_sources//lin_sys/direct/qdldl -I../osqp_sources//lin_sys/direct/qdldl/amd/include -I../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/include -I/usr/share/R/include -fpic -DR_LANG=TRUE -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ../osqp_sources//src/auxil.c -o ../osqp_sources//src/auxil.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
mkdir -p ./lib/
ar rv ./lib//libosqp.a ../osqp_sources//src/auxil.o ../osqp_sources//src/cs.o ../osqp_sources//src/ctrlc.o ../osqp_sources//src/kkt.o ../osqp_sources//src/lin_alg.o ../osqp_sources//src/lin_sys.o ../osqp_sources//src/osqp.o ../osqp_sources//src/polish.o ../osqp_sources//src/proj.o ../osqp_sources//src/scaling.o ../osqp_sources//src/util.o ../osqp_sources//lin_sys/lib_handler.o ../osqp_sources//lin_sys/direct/pardiso/pardiso_interface.o ../osqp_sources//lin_sys/direct/pardiso/pardiso_loader.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/SuiteSparse_config.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_1.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_2.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_aat.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_control.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_defaults.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_info.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_order.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_post_tree.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_postorder.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_preprocess.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_valid.o ../osqp_sources//lin_sys/direct/qdldl/qdldl_interface.o ../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/src/qdldl.o
ar: creating ./lib//libosqp.a
a - ../osqp_sources//src/auxil.o
a - ../osqp_sources//src/cs.o
a - ../osqp_sources//src/ctrlc.o
a - ../osqp_sources//src/kkt.o
a - ../osqp_sources//src/lin_alg.o
a - ../osqp_sources//src/lin_sys.o
a - ../osqp_sources//src/osqp.o
a - ../osqp_sources//src/polish.o
a - ../osqp_sources//src/proj.o
a - ../osqp_sources//src/scaling.o
a - ../osqp_sources//src/util.o
a - ../osqp_sources//lin_sys/lib_handler.o
a - ../osqp_sources//lin_sys/direct/pardiso/pardiso_interface.o
a - ../osqp_sources//lin_sys/direct/pardiso/pardiso_loader.o
a - ../osqp_sources//lin_sys/direct/qdldl/amd/src/SuiteSparse_config.o
a - ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_1.o
a - ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_2.o
a - ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_aat.o
a - ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_control.o
a - ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_defaults.o
a - ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_info.o
a - ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_order.o
a - ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_post_tree.o
a - ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_postorder.o
a - ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_preprocess.o
a - ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_valid.o
a - ../osqp_sources//lin_sys/direct/qdldl/qdldl_interface.o
a - ../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/src/qdldl.o
ranlib ./lib//libosqp.a
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
make[1]: Entering directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
rm -f ../osqp_sources//src/auxil.o ../osqp_sources//src/cs.o ../osqp_sources//src/ctrlc.o ../osqp_sources//src/kkt.o ../osqp_sources//src/lin_alg.o ../osqp_sources//src/lin_sys.o ../osqp_sources//src/osqp.o ../osqp_sources//src/polish.o ../osqp_sources//src/proj.o ../osqp_sources//src/scaling.o ../osqp_sources//src/util.o ../osqp_sources//lin_sys/lib_handler.o ../osqp_sources//lin_sys/direct/pardiso/pardiso_interface.o ../osqp_sources//lin_sys/direct/pardiso/pardiso_loader.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/SuiteSparse_config.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_1.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_2.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_aat.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_control.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_defaults.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_info.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_order.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_post_tree.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_postorder.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_preprocess.o ../osqp_sources//lin_sys/direct/qdldl/amd/src/amd_valid.o ../osqp_sources//lin_sys/direct/qdldl/qdldl_interface.o ../osqp_sources//lin_sys/direct/qdldl/qdldl_sources/src/qdldl.o
make[1]: Leaving directory '/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/00_pkg_src/osqp/src/osqp'
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdf75293ec6f/Rcpp/include"   -DR_LANG=TRUE -I./osqp/include/osqp -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c osqp_solve_interface.cpp -o osqp_solve_interface.o
In file included from ./osqp/include/osqp/types.h:8:0,
                 from ./osqp/include/osqp/osqp.h:9,
                 from osqp_solve_interface.cpp:3:
./osqp/include/osqp/glob_opts.h:13:28: fatal error: osqp_configure.h: No such file or directory
compilation terminated.
/usr/lib/R/etc/Makeconf:168: recipe for target 'osqp_solve_interface.o' failed
make: *** [osqp_solve_interface.o] Error 1
make: *** Waiting for unfinished jobs....
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdf75293ec6f/Rcpp/include"   -DR_LANG=TRUE -I./osqp/include/osqp -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c RcppExports.cpp -o RcppExports.o
ERROR: compilation failed for package ‘osqp’
* removing ‘/tmp/RtmpcwuZam/filefdf745de3c7f/osqp.Rcheck/osqp’

```
### CRAN

```
* installing *source* package ‘osqp’ ...
** package ‘osqp’ successfully unpacked and MD5 sums checked
+ hash cmake
+ echo -- No cmake, so I will try to make libosqp.a via R Makevars instead
-- No cmake, so I will try to make libosqp.a via R Makevars instead
** libs
