Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF46558E31C
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Aug 2022 00:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbiHIWT1 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 9 Aug 2022 18:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbiHIWTR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 Aug 2022 18:19:17 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB4427B06
        for <kernel-janitors@vger.kernel.org>; Tue,  9 Aug 2022 15:19:16 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id 5so5169265uay.5
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Aug 2022 15:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=ej3T27wdcOl5hgxFKEEvscpLUDARFbq7IX1O4+1Fbq8=;
        b=Z2zG9V0L+NdjYWw7XcVhjijeI3G/JwlN+Wr8/BMC9KvmoSvUaYWHvHkvZLbX2fxPiF
         pl24ka9ZTBtxD0bxKjByr0hiz/nZLY0tNXCUvkB8zgMsAc19H3d2o3q8kQT/2Xld+qFn
         XVYiqhjeHGpeFkL41kTBI34LvDDsxi8DaXOIsaSsPDXCQhTi9KNIlLU26gJbPHrId4ZF
         XzHKuoYO9hIBGiALkPbJhiKqUtz/FlkHLXXPAypSYjwCQYTrQf/CxIRVPWfSdW4UXEA9
         jih7XkET9+49pBAxoW1ufryewl8qJ+/km/GEx0SOYe0+lW03mS0OWD1IwaqzuzwIlH4z
         3Mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=ej3T27wdcOl5hgxFKEEvscpLUDARFbq7IX1O4+1Fbq8=;
        b=CNTeq/QwcuoT+ehB7ZflHFFD/taBbyark+B0YTDuy+wCjJhRDuPXnA/pnMI6t9k49U
         +eOCESaw0WzNXuP7k0ntciAnPN9jZM4JCnx9uKJneCjntk4N2c7YgFzJPNOn/qtEF6eN
         P95HUHbXOC3ufKA0MygIdaYX9R25ZoiDGM4PUoMnugtvcx0dev6JfXxQAUjLu+4X5Eg0
         d1YV7hjo4ZSycweDh8nQHE4QQ6xENNLB88H/4rXl32PySYezzCuYTMdphNXGGMBYGMBX
         mfFVelgKRvi49NGRwQ+96Vpl+0ffsVRUPCB3Oo1S5kpzVMlLWg+hl2/k97NdOvG/AcFa
         5Dwg==
X-Gm-Message-State: ACgBeo2+HrOryLMzyY6fjw5E0MeWLEV9zciHgfU/W5TAWUS75AAk2qXt
        1OpaaVyWJ8vZ1PfTBEmyfu2mKspIIMC2MedS5xE=
X-Google-Smtp-Source: AA6agR5Q5CLWgHty5izNxlgM0tVr3ZuK/IKwxU85pSpZtaWEDsgNZyQPtWUcHM6/nAClqyMHmrl2YBEPjciW34/kjB0=
X-Received: by 2002:ab0:6287:0:b0:38c:5a1d:109 with SMTP id
 z7-20020ab06287000000b0038c5a1d0109mr8469226uao.29.1660083555570; Tue, 09 Aug
 2022 15:19:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:437:0:0:0:0:0 with HTTP; Tue, 9 Aug 2022 15:19:14 -0700 (PDT)
Reply-To: wijh555@gmail.com
From:   "Prof. Chin Guang" <confianzayrentabilidad@gmail.com>
Date:   Tue, 9 Aug 2022 15:19:14 -0700
Message-ID: <CANrrfX4aP+ksiT=9A1Q7ezDS73wESxOFhv1jNLcTeDLX+qQ_6Q@mail.gmail.com>
Subject: Good Day,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

-- 
Hello,
We the Board Directors believe you are in good health, doing great and
with the hope that this mail will meet you in good condition, We are
privileged and delighted to reach you via email" And we are urgently
waiting to hear from you. and again your number is not connecting.

Sincerely,
Prof. Chin Guang
