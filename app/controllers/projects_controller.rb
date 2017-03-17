class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.all
    @page_title_details = "Projects"
  end

  def new
    @project = Project.new
    @page_title_details = "New Project"
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = "Project successfully created!"
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
    @page_title_details = "Projects"
  end

  def edit
    @page_title_details = "Edit Project"
  end

  def update
    @page_title_details = "Edit Project"

    if @project.update(project_params)
      flash[:success] = "Project successfully updated!"
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    @project.remove_images!
    flash[:success] = "Project successfully deleted!"
    redirect_to projects_path
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(
        :user_id, 
        :name, 
        :description, 
        :github,
        :website,
        :screencast,
        :preview,
        :project_type,
        :client,
        { images: [] },
        technology_ids: []
      )
    end
end
