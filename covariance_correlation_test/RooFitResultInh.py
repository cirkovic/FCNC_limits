from ROOT import *

class RooFitResultInh (RooFitResult):

    def __init__(self, rfr):
        self = rfr

    def setInitParListInh(self, list):
        return self._RooFitResult__setInitParList(list)

