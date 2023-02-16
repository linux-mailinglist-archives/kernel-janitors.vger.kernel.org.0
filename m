Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC7A7699343
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Feb 2023 12:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjBPLhk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 16 Feb 2023 06:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbjBPLhg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Feb 2023 06:37:36 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A3E56ED6
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Feb 2023 03:37:26 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id t24so4446054eji.4
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Feb 2023 03:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hrgUxFedjti7TQosgzsXJfPwpACpM3jDB7nfCX1lUc4=;
        b=aARTtKPe5KHldT0kv+Isi1eI6LJaG3A0g5rXFpnrafOULv+j0Zfx58vODCQ+AqNAB2
         dMYEkOd3cMODrJQmXw0BsGBhG7ULprYGNXOccIiCAlHDMzBuR681BzazhwFcyfhlpEVx
         oSHrcj+8ImUfUNZrpQVu4EEQ/MqxW4iS8eTgp9Rp5WRFh7hYssAleVCPFSvWF8I81lpm
         sEs6MyR3CNDUtMg7UkzwD87mk8gAlGDs6hg70P2jwrtObjfU1N8/QVmEBTMArftS+lKM
         jmdUSarMY+e6kV+Nu8jbZktPcBie3Mg8T83iqJiaEX7DLftCi2K5W4K2nfSIcX+SRraE
         xqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrgUxFedjti7TQosgzsXJfPwpACpM3jDB7nfCX1lUc4=;
        b=k16VL0b2oElUNSuXwGyHq3MUADDeYPTgM2LNZvUb6AneJesYOpHV1PotFNSgCtho0h
         6LB5fYYS/dTAV7czDxW9jrWPVRqW68ScEL5eLQbn3UejbgGuuPwummxogwizTTFluvNi
         8V4kxafCQ35NIvfoFTGjknzdzxg5OuavzJLCABO27Q8TIlBMMDAqaPBCT1musGsNUi4K
         YUs0iHAzbOhN+d/BhT2WciWli1EH6i2E58lymw7ZhabOaaShRTcFPxfecS885RZadAvQ
         hcinH417NQ//hKYcWGvLkNHLbIWMd5B9n2EGMpOJEa5oZA4h44JwL71okh3jaOGILzEL
         ahzQ==
X-Gm-Message-State: AO0yUKVl7eGlR7AiX2WYpBPfiEXzk4XiDOgamiiecT7C/Prl5eyMi5hm
        3XD/b6dKHWEFZ4YAQO2vcfsmy82MO/C+wEz6CjI=
X-Google-Smtp-Source: AK7set9ediryr9V+3ZbUc8y29occOXaa1fTdJI0wmvsk0uTfzWdrWb2fhUWEoEFEqeD8YhTaTi3IRk0aUUDiE3MJjYc=
X-Received: by 2002:a17:907:76f0:b0:8b1:30eb:9dba with SMTP id
 kg16-20020a17090776f000b008b130eb9dbamr2714771ejc.6.1676547444851; Thu, 16
 Feb 2023 03:37:24 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7208:5482:b0:62:8a9d:63db with HTTP; Thu, 16 Feb 2023
 03:37:24 -0800 (PST)
From:   SFG Finance <simab.projet@gmail.com>
Date:   Thu, 16 Feb 2023 12:37:24 +0100
Message-ID: <CAJQMEn6sd=Q-BHAq8U8X6npOEGhbniy4n5-KGH31X6qpLa7cbw@mail.gmail.com>
Subject: =?UTF-8?B?SsOTIFJFR0dFTFQgS8ONVsOBTk9L?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--=20
Az SFG Finance strukt=C3=BAra p=C3=A9nz=C3=BCgyi seg=C3=ADts=C3=A9get ny=C3=
=BAjt a vil=C3=A1g b=C3=A1rmely pontj=C3=A1n
lak=C3=B3hellyel rendelkez=C5=91 term=C3=A9szetes vagy jogi szem=C3=A9lynek=
.
Seg=C3=ADts=C3=A9gre van sz=C3=BCks=C3=A9ge a napi finansz=C3=ADroz=C3=A1si=
 probl=C3=A9m=C3=A1k megold=C3=A1s=C3=A1hoz?
Mennyire van sz=C3=BCks=C3=A9ged ?
Most vagy soha.
L=C3=A9pjen kapcsolatba finansz=C3=ADroz=C3=A1si csoportunkkal a Facebook M=
essengeren:
https://www.facebook.com/sfg.finances
VAGY E-mailben: sg.finance@gmail.com
