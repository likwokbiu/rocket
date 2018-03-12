require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test

  def teardown
    @rocket = nil
  end

  def test_create_rocket_with_all_default
    # arrange
    @rocket = Rocket.new({})

    # act
    expected = Rocket
    actual = @rocket.class

    #assert
    assert_equal(expected, actual)
  end

  def test_create_rocket_with_name
    # arrange
    @rocket = Rocket.new({name: "Mars I"})

    # act
    expected = "Mars I"
    actual = @rocket.name

    #assert
    assert_equal(expected, actual)
  end

  def test_create_rocket_without_name
    # arrange
    @rocket = Rocket.new({})

    # act
    expected = nil
    actual = @rocket.name

    #assert
    refute_equal(expected, actual)
  end

  def test_create_rocket_with_colour
    # arrange
    @rocket = Rocket.new({colour: "white"})

    # act
    expected = "white"
    actual = @rocket.colour

    #assert
    assert_equal(expected, actual)
  end

  def test_create_rocket_without_colour
    # arrange
    @rocket = Rocket.new({})

    # act
    expected = nil
    actual = @rocket.colour

    #assert
    refute_equal(expected, actual)
  end

  def test_create_rocket_with_fly_status_true
    # arrange
    @rocket = Rocket.new({flying: true})

    # act
    expected = true
    actual = @rocket.flying?

    #assert
    assert_equal(expected, actual)
  end

  def test_create_rocket_with_fly_status_false
    # arrange
    @rocket = Rocket.new({flying: false})

    # act
    expected = false
    actual = @rocket.flying?

    #assert
    assert_equal(expected, actual)
  end

  def test_create_rocket_with_fly_status_nil
    # arrange
    @rocket = Rocket.new({})

    # act
    expected = false
    actual = @rocket.flying?

    #assert
    assert_equal(expected, actual)
  end

  def test_update_name
    # arrange
    @rocket = Rocket.new({name: "Mars I"})

    # actual
    new_value = "Jupiter I"
    @rocket.name = new_value
    expected = new_value
    actual = @rocket.name

    #assert
    assert_equal(expected, actual)
  end

  def test_update_colour
    # arrange
    @rocket = Rocket.new({colour: "black"})

    # actual
    new_value = "white"
    @rocket.colour = new_value
    expected = new_value
    actual = @rocket.colour

    #assert
    assert_equal(expected, actual)
  end

  def test_lift_off_when_flying
    # arrange
    @rocket = Rocket.new({flying: true})

    # actual
    expected = false
    actual = @rocket.lift_off

    #assert
    assert_equal(expected, actual)
  end

  def test_lift_off_when_not_flying_1_check_return
    # arrange
    @rocket = Rocket.new({})

    # actual
    expected = true
    actual = @rocket.lift_off

    #assert
    assert_equal(expected, actual)
  end

  def test_lift_off_when_not_flying_2_check_fly_status
    # arrange
    @rocket = Rocket.new({})

    # actual
    expected = true
    @rocket.lift_off
    actual = @rocket.flying?

    #assert
    assert_equal(expected, actual)
  end

  def test_land_when_flying_1_check_return
    # arrange
    @rocket = Rocket.new({flying: true})

    # actual
    expected = true
    actual = @rocket.land

    #assert
    assert_equal(expected, actual)
  end

  def test_land_when_flying_2_check_fly_status
    # arrange
    @rocket = Rocket.new({flying: true})

    # actual
    expected = false
    @rocket.land
    actual = @rocket.flying?

    #assert
    assert_equal(expected, actual)
  end

  def test_landf_when_not_flying
    # arrange
    @rocket = Rocket.new({})

    # actual
    expected = false
    actual = @rocket.land

    #assert
    assert_equal(expected, actual)
  end

  def test_status_when_flying
    # arrange
    @rocket = Rocket.new({flying: true})

    # actual
    name = @rocket.name
    expected = "Rocket #{name} is flying through the sky!"
    actual = @rocket.status

    #assert
    assert_equal(expected, actual)
  end

  def test_status_when_not_flying
    # arrange
    @rocket = Rocket.new({})

    # actual
    name = @rocket.name
    expected = "Rocket #{name} is ready for lift off!"
    actual = @rocket.status

    #assert
    assert_equal(expected, actual)
  end

end
