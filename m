Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 106F0542E9B
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Jun 2022 13:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237131AbiFHLCa (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 Jun 2022 07:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236041AbiFHLC3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Jun 2022 07:02:29 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE132814A2
        for <kernel-janitors@vger.kernel.org>; Wed,  8 Jun 2022 04:02:28 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id y15so16894503ljc.0
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jun 2022 04:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=cwHCFxNZfdLDfyPThL+uTO+4unUHZXMe5v3cBT1R5wc=;
        b=quic5bo2vy04Yor6BDtEGD/E5nXBch7g61LBLX8Rf3HMZticZg9nRw9FbCFSSwLTOZ
         BMCwhH5sAtGeg7EL7UJ1n2w9CPXDIHTlrv4hKVYM37WviRIvypcWScoHAU1iqRAjZPT+
         S9JVeXjaWMDA0ezrlTFwQ98a6w6udKOMVtTBLb6xr7cl+KaEZJ7TGoNb3TMXHAx3j7SJ
         HpBjKskNNtBeqPGsOQA4XdIV4FQltBkGWg75xwIwMQEoaFQMt9ZS2jLULNMjjkP8tNyM
         AP+Oil4y/RodLPyj7wk9vh3Ki37rXwiBiqbt2DrJxf5q5DXvr8bCnggO3fTMBZ45YR6j
         WiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=cwHCFxNZfdLDfyPThL+uTO+4unUHZXMe5v3cBT1R5wc=;
        b=Tx6G24AA7sxYctF6dvwsTKo8uFxeSZ56MwhWkFrbBtv7gNy10kWz0uzANNxXFElpwY
         EDF6G04645j8QbuyH0xCt6OQAtFYRdNXfMheQwljH4YtuqqYhuS2QQB4KQImJyElwPLs
         GOQ1vh4cQxNBQ73OstRdzxPswlilBf5PuO0Drd/3hzkS6wKH1Bq5YH2GGqsW73LqZ8Hv
         Texm1yFkx5LUtwF7jBSIK92uAi5uAdDm537vFWuy8sMa/jFkXukpsxVb6DyEzCm3+Mpj
         GLq9uFNMWG4NzQu7LlQlDc9LxxWIKN5oZ4l3nb25kG5IKNSNFEhMsKIgBe3X0HnR+hYQ
         BiUw==
X-Gm-Message-State: AOAM530ug05Q7uhDw7zwXfgADlf4KH9xOc0PR0QNkGYQuwyMqGez+XYJ
        jZZqB4tj0HLJ5njd4Me+qWenIvEKQ5iLaIVNamM=
X-Google-Smtp-Source: ABdhPJywdDtmF/lR6N2dO6/RipwKQtrhAjkQ/m1WhpVkBfwjgktauSPs5ZKmQHvUIyWN7WWvM4PGUKTNrhDuw9MdYjU=
X-Received: by 2002:a2e:b8ce:0:b0:255:b151:3715 with SMTP id
 s14-20020a2eb8ce000000b00255b1513715mr3668917ljp.491.1654686146852; Wed, 08
 Jun 2022 04:02:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa6:c3a1:0:b0:1f2:b9db:65c with HTTP; Wed, 8 Jun 2022
 04:02:26 -0700 (PDT)
Reply-To: alifseibou@gmail.com
From:   MR MALICK <anubis14172@gmail.com>
Date:   Wed, 8 Jun 2022 04:02:26 -0700
Message-ID: <CAJRrMJnWUQdfQSvp5icRcP8G--gwtTBCFBApR8cr8p4Hd0O4Kw@mail.gmail.com>
Subject: =?UTF-8?Q?PREMIO_GANADOR_DE_LOTER=C3=8DA=2E=3B=3B?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,SUBJ_ALL_CAPS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

0JLQq9CY0JPQoNCr0Kgg0JIg0JvQntCi0JXQoNCV0K4uDQoNCtCS0LDRiNCwINGN0LvQtdC60YLR
gNC+0L3QvdCw0Y8g0L/QvtGH0YLQsCDQstGL0LjQs9GA0LDQu9CwIDIgNjAwIDAwMCDQvNC40LvQ
u9C40L7QvdC+0LIg0LTQvtC70LvQsNGA0L7Qsi4NCtCh0LLRj9C20LjRgtC10YHRjCDRgSDQsdCw
0YDRgNC40YHRgtC10YDQvtC8INCt0LTQstCw0YDQtNC+0Lwg0KDRjdC50LzQvtC90LTQvtC8INC/
0L4g0Y3Qu9C10LrRgtGA0L7QvdC90L7QuSDQv9C+0YfRgtC1INC30LTQtdGB0YwNCiggZWRhaGdh
dG9yQGdtYWlsLmNvbSApLCDRh9GC0L7QsdGLINC30LDQv9GA0L7RgdC40YLRjCDRgdCy0L7QuSDQ
stGL0LjQs9GA0YvRiNC90YvQuSDRhNC+0L3QtCwg0YPQutCw0LfQsNCyDQrRgdCy0L7QuCDQtNCw
0L3QvdGL0LUg0YHQu9C10LTRg9GO0YnQuNC8INC+0LHRgNCw0LfQvtC8LiDQstCw0YjQtSDQv9C+
0LvQvdC+0LUg0LjQvNGPLCDQstCw0YjQsCDRgdGC0YDQsNC90LAuINCy0LDRiA0K0LTQvtC80LDR
iNC90LjQuSDQsNC00YDQtdGBINC4INC90L7QvNC10YAg0YLQtdC70LXRhNC+0L3QsC4NCg0K0KEg
0KPQstCw0LbQtdC90LjQtdC8Li4NCtCzLdC9INCc0LDQu9C40Log0KHQsNC80LHQsC4uLi4NCg==
