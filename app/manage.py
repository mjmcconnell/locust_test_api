#!/usr/bin/env python
# stdlib imports
import sys

# local imports
from core.utils import set_env_vars

if __name__ == "__main__":
    from django.core.management import execute_from_command_line

    # Set the apps environment variables based of the `.env` file, if one exists
    set_env_vars()

    execute_from_command_line(sys.argv)
