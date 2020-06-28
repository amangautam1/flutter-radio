import 'package:scoped_model/scoped_model.dart';

class PlayerModel extends Model {
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  void update(value) {
    // First, increment the counter
    if(value!=null){
      _isPlaying=value;
    }
    else
    _isPlaying=!_isPlaying;
    
    // Then notify all the listeners.
    notifyListeners();
  }

}