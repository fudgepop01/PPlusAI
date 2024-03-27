meta:
  id: move_def
  ks-debug: false
  ks-opaque-types: false
  endian: be
  encoding: ascii
  imports:
    - anim_cmd
seq:
  - id: header
    type: sakurai_header
    size: 0x20
    doc: |
      i'm a header, WEEEEEEE
  - id: body
    type: sakurai_body
    size: header.size - 0x20
types: 
  sakurai_header:
    seq:
    - id: size
      type: s4
    - id: lookup_entry_offset
      type: s4
    - id: lookup_entry_count
      type: s4
    - id: section_count
      type: s4
    - id: external_subroutine_count
      type: s4
    - id: padding
      size-eos: true
  sakurai_body:
    instances:
      lookup_entries:
        pos: _parent.header.lookup_entry_offset
        type: lookup_table(
          _parent.header.lookup_entry_count,
          _parent.header.section_count,
          _parent.header.external_subroutine_count)
      sections:
        pos: 0
        type: section(lookup_entries.sections[_index], lookup_entries.string_table_pos)
        repeat: expr
        repeat-expr: _parent.header.section_count
    types:
      lookup_table:
        params:
          - id: lookup_count
            type: u4
          - id: section_count
            type: u4
          - id: external_subroutine_count
            type: u4
        seq:
          - id: entries
            type: lookup_entry
            repeat: expr
            repeat-expr: lookup_count
          - id: sections
            type: section_entry
            repeat: expr
            repeat-expr: section_count
          - id: external_subroutines
            type: external_subroutine_entry
            repeat: expr
            repeat-expr: external_subroutine_count
          - size: 0
            if: string_table_pos < 0
        instances:
          string_table_pos:
            value: _io.pos
      lookup_entry:
        seq:
          - id: entry_offset
            type: s4
      section_entry:
        seq:
          - id: content_offset
            type: s4
          - id: string_offset
            type: s4
      external_subroutine_entry:
        seq:
          - id: offset_linked_list
            type: s4
          - id: string_offset 
            type: s4
      section:
        params:
          - id: entry
            type: section_entry
          - id: string_table_pos
            type: u4
        enums:
          section_type:
            -1: unk
            1: anim_cmd
            2: data_common
            3: data
        instances:
          name:
            pos: string_table_pos + entry.string_offset
            type: strz
          data_pos:
            value: entry.content_offset
          data:
            pos: entry.content_offset
            type:
              switch-on: |
                name.substring(0, 12) == 'gameAnimCmd_'
                or name.substring(0, 14) == 'effectAnimCmd_'
                or name.substring(0, 19) == 'statusAnimCmdGroup_'
                or name.substring(0, 17) == 'statusAnimCmdPre_'
                or name.substring(0, 18) == 'statusAnimCmdExit_'
                or name.substring(0, 14) == 'statusAnimCmd_'
                ? section_type::anim_cmd
                  : name == 'dataCommon'
                  ? section_type::data_common
                  : name == 'data'
                  ? section_type::data
                    : section_type::unk
              # section_type::data
              cases:
                'section_type::anim_cmd': anim_cmd # anim_cmd_stuff
                'section_type::data': arc_fighter_data
                'section_type::data_common': arc_fighter_data_common
                _: u4
      external_subroutine:
        params:
          - id: entry
            type: external_subroutine_entry
          - id: string_table_pos
            type: u4
        instances:
          name:
            pos: string_table_pos + entry.string_offset
            type: strz
          offsets: 
            pos: entry.offset_linked_list
            type: s4
            repeat: until
            repeat-until: _ == 0
      arc_fighter_data:
        seq:
          - {id: subaction_flags_start, type: s4}
          - {id: model_visibility_start, type: s4}
          - {id: attribute_start, type: s4}
          - {id: sse_attribute_start, type: s4}
          - {id: misc_section_offset, type: s4}
          - {id: common_action_flags_start, type: s4}
          - {id: action_flags_start, type: s4}
          - {id: unknown7, type: s4}
          - {id: action_interrupts, type: s4}
          # Luc = 0x13
          - {id: entry_actions_start, type: ptr('u4')}
          - {id: exit_actions_start, type: ptr('u4')}
          - {id: action_pre_start, type: s4}
          # Luc = 0x1eb
          - {id: subaction_main_start, type: ptr('u4')}
          - {id: subaction_gfx_start, type: ptr('u4')}
          - {id: subaction_sfx_start, type: ptr('u4')}
          - {id: subaction_other_start, type: ptr('u4')}
          - {id: anchored_item_positions, type: s4}
          - {id: gooey_bomb_positions, type: s4}
          - {id: bone_ref1, type: s4}
          - {id: bone_ref2, type: s4}
          - {id: entry_action_overrides_start, type: s4}
          - {id: exit_action_overrides_start, type: s4}
          - {id: unknown22, type: s4}
          - {id: samus_arm_cannon_positions, type: s4}
          - {id: unknown24, type: s4}
          - {id: static_articles_start, type: s4}
          - {id: entry_articles_start, type: s4}
          - {id: flags1, type: s4}
          - {id: flags2, type: s4}
      arc_fighter_data_common:
        seq:
          - {id: global_ics, type: s4}
          - {id: global_ics_sse, type: s4}
          - {id: ics, type: s4}
          - {id: ics_sse, type: s4}
          - {id: entry_actions_start, type: "ptr_ptr_table('anim_cmd', 0x112)"}
          - {id: exit_actions_start, type: "ptr_ptr_table('anim_cmd', 0x112)"}
          - {id: flash_overlay_array, type: s4}
          - {id: unk7, type: s4}
          - {id: unk8, type: s4}
          - {id: item_swing_data, type: s4}
          - {id: unk10, type: s4}
          - {id: unk11_offset_table, type: s4}
          - {id: unk12, type: s4}
          - {id: unk13, type: s4}
          - {id: unk14, type: s4}
          - {id: unk15, type: s4}
          - {id: unk16, type: s4}
          - {id: patter_power_mul, type: s4}
          - {id: rgba_color, type: s4}
          - {id: flash_overlay_offset, type: s4}
          - {id: screen_tints, type: s4}
          - {id: leg_bones, type: s4}
          - {id: unk22_table_reference, type: "ptr('unk22_table')"}
  unk22_table:
    seq:
    - id: offset
      type: s4
    - id: length
      type: u4
    instances:
      objects:
        pos: offset
        type: s4
        repeat: expr
        repeat-expr: length
  dummy:
    instances:
      d:
        value: '"dummy"'
  atype:
    params:
      - id: dtype
        type: str
    seq:
      - id: data
        type: 
          switch-on: dtype
          cases:
            '"anim_cmd"': anim_cmd
            '"f4"': f4
            '"u1"': u1
            '"u2"': u2
            '"u4"': u4
            '"s1"': s1 
            '"s2"': s2 
            '"s4"': s4
            '"unk22_table"': unk22_table
            _: dummy
  ptr:
    params:
      - id: dtype
        type: str
    seq:
      - id: offset
        type: s4
    instances:
      data:
        if: offset != 0
        pos: offset
        type: atype(dtype)
          
  ptr_table:
    params:
      - id: dtype
        type: str
      - id: amt
        type: s4
    seq:
      - id: entries
        repeat: expr
        repeat-expr: amt
        type: ptr(dtype)
        
  ptr_ptr:
    params:
      - id: dtype
        type: str
    seq:
      - id: offset
        type: s4
    instances:
      ptr:
        if: offset != 0
        pos: offset
        type: ptr(dtype)

  ptr_ptr_table:
    params:
      - id: dtype
        type: str
      - id: amt
        type: s4
    seq:
      - id: offset
        type: s4
      - id: count
        type: u4
        if: amt == 0
    instances:
      len:
        value: |
          amt == -1 ? 0 
          : amt == 0 ? count 
          : amt
      ptr_table:
        if: offset != 0
        pos: offset
        type: "ptr_table(dtype, len)"