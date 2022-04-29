// Generated by gencpp from file executive/Waypoint.msg
// DO NOT EDIT!


#ifndef EXECUTIVE_MESSAGE_WAYPOINT_H
#define EXECUTIVE_MESSAGE_WAYPOINT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace executive
{
template <class ContainerAllocator>
struct Waypoint_
{
  typedef Waypoint_<ContainerAllocator> Type;

  Waypoint_()
    : latitude(0.0)
    , longitude(0.0)
    , waypoint_number(0)
    , is_last(false)  {
    }
  Waypoint_(const ContainerAllocator& _alloc)
    : latitude(0.0)
    , longitude(0.0)
    , waypoint_number(0)
    , is_last(false)  {
  (void)_alloc;
    }



   typedef float _latitude_type;
  _latitude_type latitude;

   typedef float _longitude_type;
  _longitude_type longitude;

   typedef int32_t _waypoint_number_type;
  _waypoint_number_type waypoint_number;

   typedef uint8_t _is_last_type;
  _is_last_type is_last;





  typedef boost::shared_ptr< ::executive::Waypoint_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::executive::Waypoint_<ContainerAllocator> const> ConstPtr;

}; // struct Waypoint_

typedef ::executive::Waypoint_<std::allocator<void> > Waypoint;

typedef boost::shared_ptr< ::executive::Waypoint > WaypointPtr;
typedef boost::shared_ptr< ::executive::Waypoint const> WaypointConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::executive::Waypoint_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::executive::Waypoint_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::executive::Waypoint_<ContainerAllocator1> & lhs, const ::executive::Waypoint_<ContainerAllocator2> & rhs)
{
  return lhs.latitude == rhs.latitude &&
    lhs.longitude == rhs.longitude &&
    lhs.waypoint_number == rhs.waypoint_number &&
    lhs.is_last == rhs.is_last;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::executive::Waypoint_<ContainerAllocator1> & lhs, const ::executive::Waypoint_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace executive

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::executive::Waypoint_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::executive::Waypoint_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::executive::Waypoint_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::executive::Waypoint_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::executive::Waypoint_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::executive::Waypoint_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::executive::Waypoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9a56c7b6ec935796a4257037b2c62ee0";
  }

  static const char* value(const ::executive::Waypoint_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9a56c7b6ec935796ULL;
  static const uint64_t static_value2 = 0xa4257037b2c62ee0ULL;
};

template<class ContainerAllocator>
struct DataType< ::executive::Waypoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "executive/Waypoint";
  }

  static const char* value(const ::executive::Waypoint_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::executive::Waypoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 latitude\n"
"float32 longitude\n"
"int32 waypoint_number\n"
"bool is_last\n"
;
  }

  static const char* value(const ::executive::Waypoint_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::executive::Waypoint_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.latitude);
      stream.next(m.longitude);
      stream.next(m.waypoint_number);
      stream.next(m.is_last);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Waypoint_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::executive::Waypoint_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::executive::Waypoint_<ContainerAllocator>& v)
  {
    s << indent << "latitude: ";
    Printer<float>::stream(s, indent + "  ", v.latitude);
    s << indent << "longitude: ";
    Printer<float>::stream(s, indent + "  ", v.longitude);
    s << indent << "waypoint_number: ";
    Printer<int32_t>::stream(s, indent + "  ", v.waypoint_number);
    s << indent << "is_last: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.is_last);
  }
};

} // namespace message_operations
} // namespace ros

#endif // EXECUTIVE_MESSAGE_WAYPOINT_H