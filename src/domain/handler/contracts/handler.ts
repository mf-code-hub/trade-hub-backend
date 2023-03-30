import { DomainEvent } from '~/shared/domain'

export interface Handler {
  notify(event: DomainEvent): Promise<void>
}
