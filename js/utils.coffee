define ["_"], (_)->
  utils = 
    serialize: (obj)->
      queue = []
      queue.push "#{key}=#{value}" for key, value of obj
      queue.join '&'

    unserialize: (hash)->
      return {} if (not hash) or (hash is '')
      hash = hash.replace /^#/, ''
      obj = {}
      try
        queue = hash.split '&'
        for query in queue
          item = query.split('=')
          obj[item[0]] =  item[1]
      catch e
        console.error e
      finally
        return obj
        
    setHash: (obj)->
      params = @unserialize location.hash
      params = _.extend params, obj
      location.hash = @serialize params
    
    getHash: (fields)->
      params = @unserialize location.hash
      if fields then params[params] else params