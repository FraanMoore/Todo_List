class TasksController < ApplicationController

    def index #responsable to show the tasks
    #start filter
        filter_by_completed = params[:completed]

        if filter_by_completed.nil? || filter_by_completed == 'All'
          @tasks = Task.all
        elsif filter_by_completed == 'Pending'
            @tasks = Task.where(completed: false)
        else
            @tasks = Task.where(completed: true)
        end
    #end filter

        @task = Task.new #new task
    end

    def show #specific task
        @task = Task.find(params[:id])
    end

    def create #create task
        @task = Task.new(task_params)

        respond_to do |format|
            if @task.save
                format.html { redirect_to tasks_url, notice: "Task was created" }
            else
                format.html {render :new, status: :unprocessable_entity}
            end
        end
    end

    def toggle #update task complete
        @task = Task.find(params[:id])
        @task.update(completed: params[:completed])

       puts({ message: "Success" }.to_json)
    end

    def edit #specifict task
        @task = Task.find(params[:id])
    end

    def update #update the task
        @task = Task.find(params[:id])
        respond_to do |format|
            if @task.update(task_params)
            format.html { redirect_to tasks_url, notice: "Task was successfully updated" }
            else
            format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def destroy #delete
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_url, notice: "Post was successfully deleted."
    end

    private  #for security

    def task_params
        params.require(:task).permit(:title, :description, :due_date)
    end
end
