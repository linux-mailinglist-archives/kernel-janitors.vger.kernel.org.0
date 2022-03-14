Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1414D8661
	for <lists+kernel-janitors@lfdr.de>; Mon, 14 Mar 2022 15:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbiCNOER (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 14 Mar 2022 10:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242106AbiCNOEQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Mar 2022 10:04:16 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8BCCF3
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Mar 2022 07:03:05 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id dr20so33697929ejc.6
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Mar 2022 07:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=yKvpO9ch1BwCw3ZOg35NMglNdsnWtNHzDAHYk4nSP2M=;
        b=AU8jZzu+qdtzYgNx0VqWXWiMlFjrdGSSv00xYE4ZiTn845A7ZOAvnsJXZr0vgJzYdS
         42bZYgunfXX2D2nR6cPGh0wSXwJw8zT6Mi1J1Kc28Apsipm6EJzXcXhwNWmWJbHASh22
         SoIR2g5qR+qm1pyUgG9LdHY4YZOVccCDGMI6zTNuFwP/WSzCvbucxO+gEJOatZRJF2dg
         bjKxYsoJUhZH3OYXFiJPbn/FTSgB/eIGL6vzzr9p6Mti4fGHqFQ6uhT9b2+lwhv343Em
         kYZB9BVOJ+aSyfTBqHLhl7yLmH42Ofwb7Q6tDirlV44uXaibKeqvLsF+FPz5WbPKyWIx
         T/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=yKvpO9ch1BwCw3ZOg35NMglNdsnWtNHzDAHYk4nSP2M=;
        b=k0x5dgbrSF7/mTP0HwlEziUxWcTuxczlLGWFBnnMCU8fvU04q72ZlYlApmXj2Cxtyd
         NJr8m1x25rhNI63D7F8tAHFW4S0H/+EO5rb5axtDSgGnOkznjW18mXZnq06khPo6ktuE
         7THnAVYYDiyVfQuNFQX4ZO3AOzmNOzuCollwbo1JsE5tiwESrrxwNGyeY8LL2XVZhPyL
         m9g6g+wab+U5/LYqeNveJpyng73EZ4BBZ/trJeYQNYMqhKwbVOfWGLN3MJkcjk5o9ZRJ
         Mak0h9ZjsqUkqqMHmPa+vsw+ASOPsOzj8ETcB02ui9+0mceBNR+DueOk7XjFH91sb02i
         RFlA==
X-Gm-Message-State: AOAM531Za/w0MTvOtEwztPxUomxY+ja9a0GlDHNNTaNIva4hCDG/zYLI
        Ol4RdrPXs3XdlkTx70F1s5jJGK5eIzcyCXv+XNY=
X-Google-Smtp-Source: ABdhPJyC49I9r458cgOtFQMgvdeSzSOPwuadJoVC8dTGdJSQ3+ycCfFkIecYepvFY8UQihRgIye3MkTq+xy434YrWo8=
X-Received: by 2002:a17:907:7b8d:b0:6db:a30:8b96 with SMTP id
 ne13-20020a1709077b8d00b006db0a308b96mr19143449ejc.221.1647266566850; Mon, 14
 Mar 2022 07:02:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:eac:0:0:0:0 with HTTP; Mon, 14 Mar 2022 07:02:46
 -0700 (PDT)
Reply-To: michellegoodman035@gmail.com
From:   michelle goodman <goodmanmichelle700@gmail.com>
Date:   Mon, 14 Mar 2022 14:02:46 +0000
Message-ID: <CAL=4yxfikuj=dN7PZzHsqA6yKu7bYKZTAvjq4Rkox5SKHW-Hwg@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:634 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4429]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [michellegoodman035[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [goodmanmichelle700[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [goodmanmichelle700[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dobr=C3=BD den, pros=C3=ADm odpov=C4=9Bzte mi, pokud si p=C5=99e=C4=8Dtete =
m=C5=AFj mail
d=C3=ADk
Michelle
