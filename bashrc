whatsmyname() {
    echo "pjayaraj"
}
alias gp=whatsmyname

# a function to source compiler environment properly
function set_compiler_env {
    # check if the argument is empty
    if [ -z $1 ]; then
        echo "Please provide the compiler installation path as an argument"
        return
    fi
    export PATH=$1/bin:$PATH
    export CC=$1/bin/gcc
    export CXX=$1/bin/g++
    # check if lib64 path exists
    if [ -d $1/lib64 ]; then
        export LD_LIBRARY_PATH=$1/lib64:$LD_LIBRARY_PATH
        export LIBRARY_PATH=$1/lib64:$LIBRARY_PATH
    fi
    if [ -d $1/lib ]; then
        export LD_LIBRARY_PATH=$1/lib:$LD_LIBRARY_PATH
        export LIBRARY_PATH=$1/lib:$LIBRARY_PATH
    fi
    export C_INCLUDE_PATH=$1/include:$C_INCLUDE_PATH
    export CPLUS_INCLUDE_PATH=$1/include:$CPLUS_INCLUDE_PATH

    echo "Compiler environment set from installation path $1"
    echo "CC: $CC"
    echo "CXX: $CXX"
    echo "$($CC --version)"
    echo "$($CXX --version)"
}
alias set_compiler_env_alias='set_compiler_env'

# to export openssl installation environment
function export_openssl {
    # check if the argument is empty
    if [ -z $1 ]; then
        echo "Please provide the openssl installation path as an argument"
        return
    fi
    export PATH=$1/bin:$PATH
    # check if lib64 path exists
    if [ -d $1/lib64 ]; then
        export LD_LIBRARY_PATH=$1/lib64:$LD_LIBRARY_PATH
        export LIBRARY_PATH=$1/lib64:$LIBRARY_PATH
    fi
    if [ -d $1/lib ]; then
        export LD_LIBRARY_PATH=$1/lib:$LD_LIBRARY_PATH
        export LIBRARY_PATH=$1/lib:$LIBRARY_PATH
    fi
    export C_INCLUDE_PATH=$1/include:$C_INCLUDE_PATH
    export CPLUS_INCLUDE_PATH=$1/include:$CPLUS_INCLUDE_PATH

    export OPENSSL_CONF=$1/ssl/openssl.cnf

    echo "OpenSSL set from installation path $1"
    which openssl
    openssl version
    openssl list --providers
}
alias export_openssl='export_openssl'

# export paths
export GCC13_PATH=$HOME/spack/opt/spack/linux-ubuntu22.04-zen4/gcc-11.3.0/gcc-13.1.0-ivlkxggj4andvbfflwrjbvl7ar2k5pca/

#cd $HOME_DIR;
echo "GCC13_PATH: $GCC13_PATH";
echo "To setup gcc13, run: ";
echo "set_compiler_env $GCC13_PATH";
#echo "source $GCC13_PATH/enable_env.sh";

echo "AOCC 5.0 path: $AOCC50_PATH";
echo "To setup aocc5.0, run: "
echo "source $AOCC50_PATH/setenv_AOCC.sh";

echo "To export openssl, run: ";
echo "export_openssl <your custom openssl installation path>";

export CTEST_PARALLEL_LEVEL=$(nproc --all);
echo "CTEST_PARALLEL_LEVEL = $CTEST_PARALLEL_LEVEL";
