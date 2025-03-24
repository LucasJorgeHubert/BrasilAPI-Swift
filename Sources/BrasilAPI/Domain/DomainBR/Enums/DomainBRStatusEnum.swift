import Foundation

extension Domain.DomainBR.Enums {
    public enum DomainBRStatusEnum: String, Codable {
        case available = "AVAILABLE"
        case availableWithTicket = "AVAILABLE_WITH_TICKET"
        case registered = "REGISTERED"
        case unavailable = "UNAVAILABLE"
        case invalidQuery = "INVALID_QUERY"
        case releaseWaiting = "RELEASE_WAITING"
        case releaseInProgress = "RELEASE_IN_PROGRESS"
        case releaseInProgressWithTickets = "RELEASE_IN_PROGRESS_WITH_TICKETS"
        case error = "ERROR"
        case domainProcessRelease = "DOMAIN_PROCESS_RELEASE"
        case unknow = "UNKNOW"
    }
}
