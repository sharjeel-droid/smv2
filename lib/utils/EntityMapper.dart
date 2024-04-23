
abstract class EntityMapper<Entity, Domain>{

  Domain? mapFromEntity(Entity entity);

  Entity? mapToEntity(Domain domain);

}