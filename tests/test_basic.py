import os
import tempfile

import pytest

from app import app as flask_app


@pytest.fixture
def client():
    db_fd, flask_app.app.config['DATABASE'] = tempfile.mkstemp()
    flask_app.app.config['TESTING'] = True

    with flask_app.app.test_client() as client:
        with flask_app.app.app_context():
            flask_app.init_db()
        yield client

    os.close(db_fd)
    os.unlink(flask_app.app.config['DATABASE'])


def test_empty_db(client):
    """Start with a blank database."""

    rv = client.get('/')
    assert b'No entries here so far' in rv.data
