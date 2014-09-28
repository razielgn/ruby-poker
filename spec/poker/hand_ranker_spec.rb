require 'poker/hand_ranker'

module Poker
  RSpec::Matchers.define :have_rank do |expected_rank|
    match { |string|
      HandRanker.new(hand string).rank == expected_rank
    }
  end

  describe HandRanker do
    describe '#rank' do
      example 'high card' do
        expect('2h 3d kd 5h 4h').to have_rank :high_card
      end

      example 'one pair' do
        expect('2h 3h 1h 3d 4h').to have_rank :one_pair
      end

      example 'two pairs' do
        expect('2h 3h 2c 3d 4h').to have_rank :two_pairs
      end

      example 'three of a kind' do
        expect('3d 2h 2s 4h 2c').to have_rank :three_of_a_kind
      end

      context 'straight' do
        example 'ten-high' do
          expect('10s 9d 8h 7s 6c').to have_rank :straight
        end

        example 'wheel' do
          expect('1c 2s 3h 4d 5s').to have_rank :straight
        end

        example 'ace high' do
          expect('1s ks qd jc 10c').to have_rank :straight
        end

        example 'wrap around' do
          expect('3c 2d 1h kc qs').not_to have_rank :straight
        end

        example 'less than two suits' do
          expect('10s 9s 8s 7s 6s').not_to have_rank :straight
        end
      end

      context 'flush' do
        example 'same suit, not in sequence' do
          expect('10s 9s 8s 7s 5s').to have_rank :flush
        end

        example 'same suit, in sequence' do
          expect('10s 9s 8s 7s 6s').not_to have_rank :flush
        end
      end

      example 'full house' do
        expect('10s 10h 10d 4s 4d').to have_rank :full_house
      end

      example 'four of a kind' do
        expect('10s 10h 10d 10c 4d').to have_rank :four_of_a_kind
      end

      context 'straight flush' do
        example 'ten-high' do
          expect('10s 9s 8s 7s 6s').to have_rank :straight_flush
        end

        example 'wheel' do
          expect('1c 2c 3c 4c 5c').to have_rank :straight_flush
        end

        example 'ace-high' do
          expect('1s ks qs js 10s').to have_rank :straight_flush
        end

        example 'wrap around' do
          expect('3c 2c 1c kc qc').not_to have_rank :straight_flush
        end
      end
    end
  end
end
