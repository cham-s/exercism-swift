struct BeerSong {
    var numberOfBeerBottles: Int
    
    init(numberOfBeerBottles: Int) {
        self.numberOfBeerBottles = numberOfBeerBottles
    }
    
    public func generateVersesOfBeerSong() -> String {
        let ending =  """
        No more bottles of beer on the wall, no more bottles of beer.\n\
        Go to the store and buy some more, 99 bottles of beer on the wall.
        """
        guard numberOfBeerBottles > 0 else { return ending }
        let verses = (1...numberOfBeerBottles).reversed().reduce("") {
            let nextNum = $1 - 1
            let moreThanOne = $1 > 1
            let plural = moreThanOne ? "s" : ""
            let noMore = "no more bottles of beer on the wall."
            let oneMore = "\(nextNum) bottle\(nextNum > 1 ? "s" : "" ) of beer on the wall."
            let moreOrNot = moreThanOne ? oneMore : noMore
            return $0 + """
            \($1) bottle\(plural) of beer on the wall, \($1) bottle\(plural) \
            of beer.\n\
            Take one down and pass it around, \(moreOrNot)\n\n
            """
        }
        return verses + ending
    }
}
