abstract class BaseDataMapper<M, E> {
  const BaseDataMapper();

  E mapToEntity(M data);

  M mapToModel(E data);

  List<E> mapToListEntity(List<M> list) {
    return list.map(mapToEntity).toList();
  }

  List<M> mapToListModel(List<E> list) {
    return list.map(mapToModel).toList();
  }
}