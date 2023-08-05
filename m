Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A877D770E24
	for <lists+kernel-janitors@lfdr.de>; Sat,  5 Aug 2023 08:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjHEGhe (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 5 Aug 2023 02:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjHEGhc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 5 Aug 2023 02:37:32 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E948FC
        for <kernel-janitors@vger.kernel.org>; Fri,  4 Aug 2023 23:37:31 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so4791594e87.3
        for <kernel-janitors@vger.kernel.org>; Fri, 04 Aug 2023 23:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691217449; x=1691822249;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=Ku6JSFiERbQgGAN/2jQrHuuQogHdMHaYK4Wn2P3aYzdziIH9Fnsd+7FnyjCocAgyRe
         012Ytyf7EAHuqPPBWo9Uuedw3gHmJd7RoVQ6G3hZze2Yzd243NrMSE4trRNzPAkQdI+r
         abCmIDMsnr7F/B9tfINFBEog9nM7rLeEMCweM6o0nfvfktZswRlUfEd7QdUGEdF3Obj6
         yok2jMhoj0EZtN3eXAhZEQJenQqKwqg94HNHdfHEwd79HH1mBN340XWl2UAlnuTXH0Ei
         y6ZgsXuiwkFetYIOFo6iImwxEiChppPGFVgTd6Wdg8vnf5eMQXgxHfXhvzgokfXr0mOi
         jN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691217449; x=1691822249;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=Y3EypeVgF4s+xWlSRt4zXDK8XrWFPW5mcwOnITYKIU5d16VU8vpYr0E3FbdPxLhtdr
         Qlx0cIXYVLnz5GGaPKB3NCKsn+lgYxtm5Pp4aejBdx4uSWtJr2Y65RZGXXW4n4tMsk6+
         YeHfmDbR+QOAGe4m4TYO+AIwJxPSjHuon7yXFY4zrMMCld39CcQRXT8jOq9WN32+kCKq
         d+hFVt546ENqLCqxMIOQU6aSPye7VwFkNElkyYEnJa0Qml9S9NGR18qZTFqu2LDykOAN
         1o5R9i7IfJYTfgwtHlKmhP58czJ0JUADaY2MmiQSE1z8KI3qFPdZxKO+9NPhwN15fhsz
         Dkxg==
X-Gm-Message-State: AOJu0Yypm3tU9wwk7PjaCAdHHBexe/Rr0XFBlfE2W/OPBUFe2SP8WsVZ
        2psRK8ECADEfgstB+o5e94TQ6u3ApWY8DBHgzK31+7q6pY0=
X-Google-Smtp-Source: AGHT+IFT11BzT/yY0u/n0j8oaq3YuWdKNcFk81uXZbWJBLt3CHz+YFeXih1JS++DP40fa64U+tlsWokEO/pCV8Mg/g8=
X-Received: by 2002:a05:6512:104e:b0:4fd:cae7:2393 with SMTP id
 c14-20020a056512104e00b004fdcae72393mr3178047lfb.2.1691217448981; Fri, 04 Aug
 2023 23:37:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7412:6629:b0:df:940:19b1 with HTTP; Fri, 4 Aug 2023
 23:37:28 -0700 (PDT)
Reply-To: bintu37999@gmail.com
From:   Bintu Felicia <bimmtu@gmail.com>
Date:   Sat, 5 Aug 2023 07:37:28 +0100
Message-ID: <CAAF5RuwPeJpi=unaXQ_FCFzgg8--c+ra_vdYppJU4GTi4hrQsg@mail.gmail.com>
Subject: HELLO...,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

How are you today? I hope you are fine. My name is Miss
Bintu Felicia . l am single looking for honest and nice
person whom i can partner with . I don't care about
your color, ethnicity, Status or Sex. Upon your reply to
this mail I will tell you more about myself and send you
more of my picture .I am sending you this beautiful mail
with a wish for much happiness
