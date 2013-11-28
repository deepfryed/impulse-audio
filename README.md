# Impulse

Pulseaudio visualizer module for Ruby.

## Dependencies

* Ruby >= 1.9.3
* pulseaudio (libpulse-dev)
* fftw3 (libfftw3-dev)

## API

```
Impulse::Engine#start
Impulse::Engine#stop
Impulse::Engine#set_source
Impulse::Engine#get_sample
Impulse::Engine#run
```

## Example

```ruby
engine = Impulse::Engine.new(10, 100) # slots and maximum value
engine.run(0.1, 0) do |sample|        # delay, pulseaudio source index, callback
  p sample
end
```

## C and Python source

http://impulse.ian-halpern.com/

## License

MIT
