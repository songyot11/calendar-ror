class CalendarsController < ApplicationController
  before_action :set_calendar, only: %i[show edit update destroy]

  def index
    @calendars = Calendar.order(start_at: 'asc')
    @calendar = Calendar.new
  end

  def edit
    @calendar.start_at = @calendar.start_at.strftime('%d-%m-%Y %H:%M')
    @calendar.end_at = @calendar.end_at.strftime('%d-%m-%Y %H:%M')
    @calendar
  end

  def create
    @calendar = Calendar.new(calendar_params)

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to calendars_path, notice: 'Calendar was successfully created.' }
      else
        @calendars = Calendar.order(start_at: 'asc')
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to calendars_path, notice: 'Calendar was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to calendars_url, notice: 'Calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  def calendar_params
    params.require(:calendar).permit(:event_name, :start_at, :end_at, :tag_color)
  end
end
