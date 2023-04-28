module ApplicationHelper
    # Use the Controller#Action to determine the current page
    def nav_bar_content(controller_name, action_name)
      case "#{controller_name}##{action_name}"
      when 'categories#index'
        'Categories of different kinds'
      when 'expenses#index'
        'Plan expenses following own budget'
      when 'devise/sessions#new'
        'Login'
      when 'devise/registrations#new'
        'Register'
      when 'categories#new' && 'expenses#new'
        'details'
      else
        ''
      end
    end
  end