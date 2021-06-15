class InteractState {
  bool _eraserMode = false;
  bool get eraserMode => _eraserMode;

  void toggleEraserMode() { _eraserMode = !_eraserMode; }
}