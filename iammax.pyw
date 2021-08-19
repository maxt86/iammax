#!/usr/bin/env python3
import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine


def main(args=[]):
    app = QGuiApplication(args)
    
    engine = QQmlApplicationEngine()
    engine.load('iammax.qml')
    
    return (
        app.exec()
        if engine.rootObjects()
        else -1
    )


if __name__ == '__main__':
    sys.exit(main(sys.argv))
