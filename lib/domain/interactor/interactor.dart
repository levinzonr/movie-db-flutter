abstract class Interactor<Input, Output> {
  Future<Output> execute([Input input]);
}