Guides
========================================

Guides typically focus around solving a specific problem, or accomplishing a commonly performed action.
Guides can include code snippets and terminal commands.

Updating Documentation
-----------------------------------

There are a handful of steps to updating the documentation:

1. Update the relevant file(s) in the ``/docs/source`` directory
2. (Optional) Delete the old local documentation files via ``make clean``
3. Build the documentation via ``make build_docs``
4. Validate the changes in the ``/docs/build`` directory

Once the changes are validated, commit the changes to github. When the changes are merged into master,
the documentation will be updated via a github actions and hosted at
`https://philliams.github.io/Python-Prefab/ <https://philliams.github.io/Python-Prefab/>`_.

Updating Code and Unit Tests
-----------------------------------
There are a handful of steps to updating the code:

1. Update the relevant file(s) in the ``/src`` directory
2. Build the dev images via ``make build_dev``
3. Run the application via ``make run_all``
4. (Optional) Validate the application manually by making requests to the servers on ports 8000 and 8501
5. Update the unit tests in the ``/unittests`` directory
6. Build the test image via ``make build_test``
7. Run the unit tests via ``make test``
8. Once the code is correct and the tests pass, lint the code via ``make lint``


Once the changes are validated, commit the changes to github.
The tests will run on commits to PR, and can be merged when it passes.