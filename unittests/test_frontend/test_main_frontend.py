import src.frontend.main_frontend as main_fe

class TestFrontEnd:

    def test_dummy_function(self):
        # Prepare
        input_str = 'some_dummy_str'

        # Run
        output_str = main_fe.dummy_function_front_end(input_str)

        # Assert
        assert input_str == output_str