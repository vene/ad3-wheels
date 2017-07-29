# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    :
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    pytest -vs --pyargs ad3
    if [ -n "$IS_OSX" ]; then  # Run 32-bit tests on dual arch wheel
        arch -i386 pytest -vs --pyargs ad3
    fi
}
