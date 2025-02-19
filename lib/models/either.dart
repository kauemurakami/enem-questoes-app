class Either<L, R> {
  final L? left;
  final R? right;

  Either._({this.left, this.right});

  /// Cria uma instância para representar o lado esquerdo (Erro).
  factory Either.left(L left) => Either._(left: left);

  /// Cria uma instância para representar o lado direito (Sucesso).
  factory Either.right(R right) => Either._(right: right);

  /// Verifica se o valor é do tipo esquerdo (Erro).
  bool get isLeft => left != null;

  /// Verifica se o valor é do tipo direito (Sucesso).
  bool get isRight => right != null;

  /// Executa uma função com base no tipo do valor.
  T fold<T>(T Function(L) ifLeft, T Function(R) ifRight) {
    if (isLeft) {
      return ifLeft(left as L);
    } else {
      return ifRight(right as R);
    }
  }
}
