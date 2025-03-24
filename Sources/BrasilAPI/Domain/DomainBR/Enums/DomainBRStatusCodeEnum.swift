import Foundation

extension Domain.DomainBR.Enums {
    public enum DomainBRStatusCodeEnum: Int, Codable {
        case available = 0
        case availableWithTicket = 1
        case registered = 2
        case unavailable = 3
        case invalidQuery = 4
        case releaseWaiting = 5
        case releaseInProgress = 6
        case releaseInProgressWithTickets = 7
        case error = 8
        case domainProcessRelease = 9
        case unknow = 10
    }
}
