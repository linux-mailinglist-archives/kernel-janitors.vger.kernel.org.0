Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 998156C6C25
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Mar 2023 16:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbjCWPTa (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 23 Mar 2023 11:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232053AbjCWPT2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Mar 2023 11:19:28 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290442B616
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Mar 2023 08:19:18 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id x3so88100955edb.10
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Mar 2023 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679584756;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EaZEaoa5Az+Owk9kP8S9MV4iQTC6KYP+QCYd3agTLNY=;
        b=UFxDmiB9r9TT3WkxQ85bzVTaMkxWLKraP3zrahrcBP9ms/Ii29CT6ScO7teb0qyx++
         HOZ0aCpmkOZpBdojA1az8iKZoiDVlXOsgFS2lXivGUNzczJXmdbE8+BdPpVfNpXwuhJO
         Te8lytSIpFms6/dn84FXiQTZEZHxv+xM5mAUkH1EtKBr9WS6NV6Ggz0XJJk28UGaGBmK
         3U8amZSX7q1MUoYfm4A9z8TBG8hh97CSvmOCF5bhgHGkuIEkaDgiwMoqONTWNRIRb6Fm
         1S7CA+54SOfIgPXAMQOJv+cb4Fcfx29ha0/6ebJPNYd7VYwrvr/Dqy/M14wMwBUfsYUY
         JqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679584756;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EaZEaoa5Az+Owk9kP8S9MV4iQTC6KYP+QCYd3agTLNY=;
        b=G580wS5y5ncCDpVfT+BE3EwPlE2Nwgv+Oc9qNepeQokDFfYb0Gja2ROcJ8uN5FDNMc
         SPk9NNgWlbWa/KQGsHG2DZuY9xfImJoct/vGqoHvZ3Edr9GMOc3tx5X/SmwucFnBxIeH
         wBvbZzn7SBqi3FJyu6moVre1vBweYdZjakfdecJUXuBeOMg11Wu3Ov1rdqCtNS4B+CDL
         V4k+QtBlY187LYog0jSbhfARQxwEvpTUB15hwfgqq7God92wUpxfL1hGdXJsurYmtxE3
         WAURato1wpiRrZF2DrjqeyBq2HxHGVfJI4FTw/JT6RVP5iYupzjVHhMFm5ihs1NkMSYi
         XFHQ==
X-Gm-Message-State: AO0yUKXDxe7TGv0M/ivJojJe+EmZoNh8vi4ez1+itK2JZHjAECmXeJo8
        xezTuwSckiCMQaCzsV8I++JEAECqagQZ7nDBMNg=
X-Google-Smtp-Source: AK7set9xwMvDyL6YnEWCYiR7RN14qP6O+SaqCSWGj6SoNyMVnPNZVQUOJG69/AYRefahEUsu7eIrOx3plZh+yhj0wk8=
X-Received: by 2002:a17:906:1e04:b0:934:b24e:26ba with SMTP id
 g4-20020a1709061e0400b00934b24e26bamr5198582ejj.7.1679584756713; Thu, 23 Mar
 2023 08:19:16 -0700 (PDT)
MIME-Version: 1.0
Sender: geremiekolani@gmail.com
Received: by 2002:a17:907:25c5:b0:8f8:3cef:b21 with HTTP; Thu, 23 Mar 2023
 08:19:16 -0700 (PDT)
From:   Kayla Manthey <sergeantkayllamanthey@gmail.com>
Date:   Thu, 23 Mar 2023 15:19:16 +0000
X-Google-Sender-Auth: oR5SmNFKtJEffGbl6qTDui80_cA
Message-ID: <CA+PxonVLef1wx6+V7UXboVsEHFhjfe7FWkz9j8SF4hbLuS9Phg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Please,  did you receive my previous email?, thank you.
