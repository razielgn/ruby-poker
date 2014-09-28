# Poker

After watching [Peer:Peer Episode 2](http://peertopeer.io/videos/2-camille-baldock/) I couldn't resist practicing the same challenge.

## The challenge

A "hand" in poker consists of five playing cards drawn from a standard deck.
Implement a system which can decide which of two hands has the highest ranking, according to the standard poker ranking rules.

## Critique

Feel free to critique anything. Actually the code is here so that you can point out how stupid I am and tell me how I can do better. :)

## Basic API

```ruby
hand = Poker::CardParser.new.parse_hand '1s ks qs js 10s'
# => #<Poker::Hand A♠ 10♠ J♠ Q♠ K♠>

Poker::HandRanker.new(hand).rank
# => #<Poker::Ranks::StraightFlush:0x007f4034f07bb8 @hand=#<Poker::Hand A♠ 10♠ J♠ Q♠ K♠>>
```

## TODOs

* Comparing hands
