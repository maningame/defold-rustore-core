#include "ChannelCallbackManager.h"

using namespace RuStoreSDK;

void ChannelCallbackManager::AddChannelCallback(std::shared_ptr<ChannelCallbackItem> item)
{
	std::lock_guard<std::mutex> lock(_mutex);

	_callbacks.push_back(item);
}

std::vector<dmScript::LuaCallbackInfo*> ChannelCallbackManager::FindLuaCallbacksByChannel(const char* channel)
{
	std::lock_guard<std::mutex> lock(_mutex);

	std::vector<dmScript::LuaCallbackInfo*> result;

	for (const auto& callback : _callbacks)
	{
		if (callback->channel == channel)
		{
			result.push_back(callback->callback);
		}
	}

	return result;
}

void ChannelCallbackManager::Clear()
{
	std::lock_guard<std::mutex> lock(_mutex);

	for (const auto& item : _callbacks)
	{
		if (item->callback != nullptr)
		{
			dmScript::DestroyCallback(item->callback);
		}
	}

	_callbacks.clear();
}

ChannelCallbackManager* ChannelCallbackManager::Instance()
{
	static ChannelCallbackManager instance;

	return &instance;
}
