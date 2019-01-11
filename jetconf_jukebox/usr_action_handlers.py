from colorlog import info

from yangson.instance import InstanceRoute

from jetconf.helpers import JsonNodeT
from jetconf.data import BaseDatastore


# ---------- User-defined handlers follow ----------

class ActionHandlersContainer:
    def __init__(self, ds: BaseDatastore):
        self.ds = ds

    def jukebox_play_act(self, ii: InstanceRoute, input_args: JsonNodeT, username: str) -> JsonNodeT:
        # Structure of RPC's input and output arguments is defined in YANG data model
        # Play song
        delay = input_args.get("delay")

        info("Called action 'play' by user '{}':".format(username))

        root = self.ds.get_data_root()
        song_node = root.goto(ii[0:-1])

        # Get file location
        lib_song_location = song_node["location"]
        info("Playing file: \"{}\" with delay {}s".format(lib_song_location, delay))


def register_action_handlers(ds: BaseDatastore):
    act_handlers_obj = ActionHandlersContainer(ds)
    ds.handlers.action.register(act_handlers_obj.jukebox_play_act, "/example-jukebox:jukebox/library/artist/album/song/play")
