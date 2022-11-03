import RxSwift

example(of: "creating observables") {
  let mostPopular: Observable<String> = Observable<String>.just(episodeV)
  let originalTrilogy = Observable.of(episodeIV, episodeV, episodeVI)
  let prequelTrilogy = Observable.of([episodeI, episodeII, episodeIII])
  let sequelTrilogy = Observable.from([episodeVII, episodeVIII, episodeIX])
}
