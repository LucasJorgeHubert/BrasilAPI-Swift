import Foundation

public protocol PIXRepositoryProtocol {
    func getPIXPartcipants() async throws -> [Domain.PIX.Models.PixParticipant]
}
