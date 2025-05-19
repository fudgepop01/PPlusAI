                          if (paVar19->actionCategory == '\x13') {
                            fVar44 = 0.95;
                          }
                          else {
                            fVar44 = 0.55;
                            if (aVar1 == grab) {
                              fVar44 = 0.8;
                            }
                            else if ((aVar1 < grab) && (slowAttack < aVar1)) {
                              fVar44 = 0.9;
                            }
                          }
                          iVar21 = (int)(param_1->aiParam).levelValue;
                          uVar22 = iVar21 * iVar21;
                          uStack_7c = uVar22 ^ 0x80000000;
                          dVar41 = (double)(fVar44 * (float)((double)(CONCAT44(local_80,uVar22) ^
                                                                     0x80000000) -
                                                            4503601774854144.0) * 0.01 * 0.01 + 0. 05
                                           );
                          if (paVar19->actionCategory != '\x13') {
                            if (iVar9->damage < 96.0) {
                              dVar41 = (double)(float)(dVar41 * (double)(iVar9->damage * 0.004166 667
                                                                        + 0.6));
                            }
                            if (-0.5 <= (iVar9->velocity).y) {
                              dVar41 = (double)(float)(dVar41 * 0.05000000074505806);
                            }
                            if (param_1->aiActPtr->aiScript == 0x80) {
                              dVar41 = (double)(float)(dVar41 * 0.300000011920929);
                            }
                          }
                          if (param_1->aiActPtr->aiScript == 0x2060) {
                            dVar41 = (double)(float)(dVar41 * 0.0);
                          }
                          fVar44 = randf/(mt_prng.o)();
                          if (dVar41 <= (double)fVar44) {
                            cVar3 = (param_1->aiParam).levelValue;
                            fVar44 = randf/(mt_prng.o)();
                            uVar22 = 100 - (int)cVar3;
                            uStack_7c = uVar22 ^ 0x80000000;
                            iVar21 = (int)((float)((double)(CONCAT44(local_80,uVar22) ^ 0x8000000 0)
                                                  - 4503601774854144.0) * 0.01 * 10.0 * fVar44 + 3 .0
                                          );
                            local_70 = (longlong)iVar21;
                            uVar17 = (undefined2)iVar21;
                            param_1->attackReactionKind = uVar17;
                            if (0.0 < (iVar9->velocity).y) {
                              param_1->attackReactionKind = uVar17 + 8;
                            }
                          }
                          else {
                            fVar16 = iVar9->targetCharacter;
                            switch(fVar16) {
                            case Fighter_Peach:
                            case Fighter_Marth:
                            case Fighter_MetaKnight:
                            case Fighter_Lucario:
                            case Fighter_Ike:
                              bVar33 = 10;
                              if (fVar16 == Fighter_MetaKnight) {
                                bVar33 = 0xc;
                              }
                              else if ((int)fVar16 < 0x16) {
                                if (fVar16 == Fighter_Marth) {
                                  bVar33 = 3;
                                }
                              }
                              else if (fVar16 == Fighter_Lucario) {
                                bVar33 = 5;
                              }
                              if ((((((byte)(aVar1 + ~none) < 2) &&
                                    (bVar33 < (byte)paVar19->attackStartFrame)) &&
                                   ((param_1->field53_0x116 & 2) != 0)) &&
                                  ((iVar21 = chk_over_ground/[aiStat]/(ai_stat.o)(iVar9),
                                   iVar21 != 0 &&
                                   (dVar42 = (double)get_lr_tgt/[aiStat]/(ai_stat.o)
                                                               (iVar9,&param_1->target),
                                   0.0 < (float)((double)iVar9->direction * dVar42))))) &&
                                 (fVar44 = randf/(mt_prng.o)(), fVar44 < (float)(dVar41 * 0.5))) {
                                if (iVar9->targetCharacter == Fighter_Peach) {
                                  uVar30 = 0x6046;
                                }
                                else {
                                  uVar30 = 0x6049;
                                }
                                goto LAB_8090ea64;
                              }
                            }
                            if (((slowAttack < aVar1) || (*(short *)&iVar9->jumpsRemaining < 1)) ||
                               (fVar44 = randf/(mt_prng.o)(), 0.6 <= fVar44)) {
                              if (paVar19->actionCategory == '\x13') {
                                fVar44 = 0.99;
                              }
                              else {
                                fVar44 = 0.7;
                              }
                              uVar22 = (uint)(param_1->aiParam).levelValue;
                              uStack_74 = uVar22 ^ 0x80000000;
                              dVar41 = (double)(fVar44 * (float)((double)(CONCAT44(local_78,uVar2 2)
                                                                         ^ 0x80000000) -
                                                                4503601774854144.0) * 0.01);
                              fVar44 = randf/(mt_prng.o)();
                              if (dVar41 <= (double)fVar44) {
                                uVar30 = 0x3060;
                              }
                              else {
                                uVar30 = 0x30d0;
                              }
                            }
                            else {
                              uVar30 = 0x2060;
                            }
                          }
                        }
                      }
                    }
                    else {
                      param_1->attackReactionKind = 10;
                    }
                  }
                }
LAB_8090ea64:
                if ((uVar30 == 0x3060) &&
                   (iVar21 = chk_transition/[aiStat]/(ai_stat.o)(iVar9,0x2000), iVar21 == 0)) {
                  uVar30 = 0;
                }