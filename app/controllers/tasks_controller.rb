class TasksController < ApplicationController
    def index
        filter_by_completed = params[:completed]

        if filter_by_completed.nil? || filter_by_completed == 'All'
          @tasks = Task.all
        elsif filter_by_completed == 'Pending'
            @tasks = Task.where(completed: false)
        else
            @tasks = Task.where(completed: true)
        end
        @task = Task.new #crea una nueva tarea
    end

    def show
        @task = Task.find(params[:id])
    end

    def create
        @task = Task.new(task_params)

        respond_to do |format|
            if @task.save
                format.html { redirect_to tasks_url, notice: "Task was created" }
            else
                format.html {render :new, status: :unprocessable_entity}
            end
        end
    end

    def toggle
        @task = Task.find(params[:id])
        @task.update(completed: params[:completed])

        render json: { message: "Success" }
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        respond_to do |format|
            if @task.update(task_params)
            format.html { redirect_to tasks_url, notice: "Task was successfully updated" }
            else
            format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_url, notice: "Post was successfully deleted."
    end

    private

    def task_params
        params.require(:task).permit(:title, :description, :due_date) #tecnica llamada "strong parameters" permite elegir que atributos son permitidos
    end
end
