import TODO_PROJECT_NAME


def test_imports():
    import TODO_PROJECT_NAME  # noqa: F401


def test_version():
    assert TODO_PROJECT_NAME.__version__ is not None
