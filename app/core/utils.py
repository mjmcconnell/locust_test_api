"""Useful functions for the core functionality of the app
"""
# stdlib imports
import os
import re


def set_env_vars():
    """Set environment variables from a .env file, located in the project
    root directory.
    """
    # Read the contents of the `.env` file
    try:
        basepath = os.path.dirname(__file__)
        filepath = os.path.abspath(os.path.join(basepath, "..", ".env"))
        with open(filepath) as f:
            content = f.read()
    except IOError:
        content = ''

    # Loop through each line and set environment variables based of key value pairs
    # key="value"
    for line in content.splitlines():
        m1 = re.match(r'\A([A-Za-z_0-9]+)=(.*)\Z', line)
        if m1:
            key, val = m1.group(1), m1.group(2)
            m2 = re.match(r"\A'(.*)'\Z", val)
            if m2:
                val = m2.group(1)
            m3 = re.match(r'\A"(.*)"\Z', val)
            if m3:
                val = re.sub(r'\\(.)', r'\1', m3.group(1))
            os.environ.setdefault(key, val)

    # Determine which settings to use for running the app
    environment = os.environ.get('ENV', 'LOCAL')
    if environment == 'LOCAL':
        os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'core.settings.local')
    elif environment == 'LIVE':
        os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'core.settings.live')
