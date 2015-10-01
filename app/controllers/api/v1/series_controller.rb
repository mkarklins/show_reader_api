module Api
  module V1
    class SeriesController < ApplicationController
      def index
        @series = Series.all
      end
    end
  end
end
